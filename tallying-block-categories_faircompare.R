#This tallies the highest breeding categories for the fair comparison blocks

library(tidyverse)
library(data.table)
library(sf)

#load data
ebird <- read.delim("WBBA2_ATLASWI_plussensitivepluszerocount_onlycodeds_nospuhslash_EBDMar2023_GOOD_082823.txt", sep="\t", header=TRUE, quote = "", stringsAsFactors = FALSE, na.strings=c(""))

#limit to atlas portal
ebird  <- ebird[ebird$project_code == "EBIRD_ATL_WI", ]

#delete uncodeds
ebird <- ebird %>%
  dplyr::filter(breeding_category %in% c('C2', 'C3', 'C4'))

#make sure date is read as date
ebird$observation_date <- as.Date(ebird$observation_date)

#pull in faircompare blocks
fair <- st_read(dsn = "fair", layer = "Fair_comparison_blocks_final")

#rename BLOCK_ID to atlas_block
names(fair)[names(fair) == 'BLOCK_ID'] <- 'atlas_block'

#merge 'fair' column onto sp, and use a right_join to keep only rows 
#that match with y (ie keep only fair column blocks)
ebirdwfair <- ebird %>%
  right_join(fair, by = "atlas_block") 

#concatenate species and block
ebirdwfair$SPECIESANDBLOCK <-  with(ebirdwfair, paste0(common_name, atlas_block))

#create duplicate of category field
ebirdwfair$highestcat <- ebirdwfair$breeding_category

#remove C from category field to make a number
ebirdwfair$highestcat<-gsub("C","",as.character(ebirdwfair$highestcat))

#make new column numeric
ebirdwfair$highestcat<-lapply(ebirdwfair$highestcat,as.numeric)

#set as data table
group <- as.data.table(ebirdwfair)

#find the single highest category for the species
maxcats <- group[group[, .I[which.max(highestcat)], by=SPECIESANDBLOCK]$V1]

#won't write with column as a list
maxcats <- apply(maxcats,2,as.character)

#convert from atomic to dataframe
maxcats<- as.data.frame(maxcats)

#convert from dataframe to tibble
maxcats<-as_tibble(maxcats)

#sum num highest category by species
faircompare <- maxcats %>%
    group_by (common_name) %>%
    dplyr::count(highestcat)

#write out to csv
write.csv(faircompare, file= "WBBA2_faircompareforblocktable.csv", row.names=FALSE)
