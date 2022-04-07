#This searches for duplicate location IDs in eBird for the exact lat long from the same observer. 
#When duplicated Locality IDs exist for the exact same location, those observations are completely masked on the species maps.
#The column NewLocID lists the smallest numbered Locality ID for each duplicated ID (listed in column C).
#Thanks to ngwalton for assistance as usual

library(dplyr)

#load ebird data
ebird <- read.delim("ebd_wiltur_201501_201912_relJun-2021WI.txt", sep="\t", header=TRUE, quote = "", stringsAsFactors = FALSE, na.strings=c(""))

# concatenate latitude and longitude and observer
ebird$concatlatlongobserver <-  with(ebird, paste0(LATITUDE, LONGITUDE, OBSERVER.ID))

#screen for duplicate locids at single location
thetibble <-(ebird %>% 
               select(concatlatlongobserver, LOCALITY.ID) %>% 
               group_by(concatlatlongobserver) %>% 
               filter(n_distinct(LOCALITY.ID) > 1))

#remove duplicates within the above file
x <- data.frame(unique(thetibble))

x$loc_num <- as.integer(sub("^L", "", x$LOCALITY.ID))

# should be FALSE
anyNA(x$loc_num)

# order by location/observer and location number
ord <- order(x$concatlatlongobserver, x$loc_num)
x <- x[ord, ]

# keeps the first occurrence of each concatlatlongobserver value which
# corresponds to the lowest loc_num per concatlatlongobserver group because it's
# x is sorted in descending order on each of these columns
uniq <- x[! duplicated(x$concatlatlongobserver), ]

indx <- match(x$concatlatlongobserver, uniq$concatlatlongobserver)
x$NewLocID <- uniq[indx, "LOCALITY.ID"]

# should be FALSE
anyNA(x$NewLocID)

x$loc_num <- NULL

x <- x[x$LOCALITY.ID != x$NewLocID, ]

#export table
write.csv(x, "new_location_ids.csv")
