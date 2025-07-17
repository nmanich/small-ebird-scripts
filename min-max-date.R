#takes the confirmed codes and finds for first date and last date by species

library(dplyr)

# import EBD (with 2 dummy columns, one with mm-dd for display in the table and one with 1900-mm-yy for sorting)
conf <- read.delim("confirmeds2withdateNOUNs.txt", quote = "", as.is = TRUE)

# set date column as date class, use excel to save format as yyyy-mm-dd
conf$date1900 <- as.Date(conf$date1900, origin = "1899-12-30")

# find first date
mins <-conf %>%
  group_by(common_name) %>%
  arrange(date1900) %>%
  slice_min(date1900)

# drop duplicates
mins2 <- mins %>% distinct(common_name, .keep_all = TRUE)

# export the early dates
write.csv(mins2, file = "mins.csv", row.names = FALSE) 

# find last date
maxs <-conf %>%
  group_by(common_name) %>%
  arrange(desc(date1900))%>%
  slice_max(date1900)

# drop duplicates
maxs2 <- maxs %>% distinct(common_name, .keep_all = TRUE)

# export the late dates
write.csv(maxs2, file = "maxs.csv", row.names = FALSE) 

