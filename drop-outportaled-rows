# discard rows that need to be outportaled
# you'll need a file with records to discard:
# in that file, column 1 is SAMPLING.EVENT.IDENTIFIER, column 2 is named discard with text TRUE if records should be dropped

library (dplyr)

# load EBD data
ebird <- read.delim("ebd_US-WI_eurgol_201501_201912_relSep-2021.txt", sep="\t", header=TRUE, quote = "", stringsAsFactors = FALSE, na.strings=c(""))

# load file with records to drop
outportal <- read.delim("outportaltest.txt", sep="\t", header=TRUE, quote = "", stringsAsFactors = FALSE, na.strings=c(""))

# join the drop values to eBird table
merged <- merge(x = ebird, y = outportal, all.x = TRUE)

# don't discard other values (replace NAs with values)
merged$discard[is.na(merged$discard)] <- "FALSE"

# remove the flagged rows
nowwithfewer <- subset(merged, discard != "TRUE")

# remove the sorting column and a stray x column
nowwithfewer <- subset(nowwithfewer, select = -c(X, discard) )

# put sampling.event.identifer column back where it lives
clean <- nowwithfewer %>% relocate(SAMPLING.EVENT.IDENTIFIER, .before = PROTOCOL.TYPE)

# export file
write.csv(clean, file = "outportals_removed.csv", row.names=FALSE)

# FYI, if you wanted to bring this .csv back into R, you could use
# ebird2 <- read.csv("outportals_removed.csv")
