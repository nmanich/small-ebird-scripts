#This tallies the highest breeding categories for all blocks

library(tidyverse)
library(data.table)

#load data
ebird <- read.delim("WBBA2_ATLASWI_plussensitivepluszerocount_onlycodeds_nospuhslash_EBDMar2023_GOOD_082823.txt", sep="\t", header=TRUE, quote = "", stringsAsFactors = FALSE, na.strings=c(""))

#limit to atlas portal
ebird  <- ebird[ebird$project_code == "EBIRD_ATL_WI", ]

#delete uncodeds
ebird <- ebird %>%
  dplyr::filter(breeding_category %in% c('C2', 'C3', 'C4'))

#make sure date is read as date
ebird$observation_date <- as.Date(ebird$observation_date)

#concatenate species and block
ebird$SPECIESANDBLOCK <-  with(ebird, paste0(common_name, atlas_block))

#create duplicate of category field
ebird$highestcat <- ebird$breeding_category

#remove C from category field to make a number
ebird$highestcat<-gsub("C","",as.character(ebird$highestcat))

#make new column numeric
ebird$highestcat<-lapply(ebird$highestcat,as.numeric)

#set as data table
group <- as.data.table(ebird)

#find the single highest category for the species
maxcats <- group[group[, .I[which.max(highestcat)], by=SPECIESANDBLOCK]$V1]

#won't write with column as a list
maxcats <- apply(maxcats,2,as.character)

#convert from atomic to dataframe
maxcats<- as.data.frame(maxcats)

#convert from dataframe to tibble
maxcats<-as_tibble(maxcats)

#sum num highest category by species
blocktotals <- maxcats %>%
    group_by (common_name) %>%
    dplyr::count(highestcat)

#write out to csv
write.csv(blocktotals, file= "WBBA2_forblocktable.csv", row.names=FALSE)
