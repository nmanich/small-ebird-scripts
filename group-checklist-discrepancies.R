#checks for records on a shared group ID that are coded differently 

library(dplyr)
library(tidyverse)

#load ebird data
ebird <- read.delim("ebd_US-WI_201501_201912_relJun-2021.txt", sep="\t", header=TRUE, quote = "", stringsAsFactors = FALSE, na.strings=c(""))

#remove records with no group id
onlygrouprecords <- ebird %>% 
  drop_na(GROUP.IDENTIFIER)

# concatenate group identifier and species
onlygrouprecords$concatspeciesgroupid <-  with(onlygrouprecords, paste0(GROUP.IDENTIFIER, COMMON.NAME))

#screen for differing codes at single groupid
discrepancy <-(onlygrouprecords %>% 
               select(GLOBAL.UNIQUE.IDENTIFIER, COMMON.NAME, OBSERVATION.COUNT, BREEDING.CODE, BREEDING.CATEGORY, BEHAVIOR.CODE, COUNTY, LOCALITY, OBSERVATION.DATE, TRIP.COMMENTS, SPECIES.COMMENTS, PROJECT.CODE, GROUP.IDENTIFIER, concatspeciesgroupid) %>% 
               group_by(concatspeciesgroupid) %>% 
               filter(n_distinct(BREEDING.CODE) > 1))

#export table
write.csv(discrepancy, "groupchecklistdiscrepancies.csv")
