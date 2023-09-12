# this condenses the sensitive species records down to just a single highest record per block
# I will use pivottable in excel to mess with it further

library(tidyverse)
library(data.table)

#load sensitive species
sens <- read.delim("ebd_relJun-2023_US-WI_Jan1995-Jul2023.txt", sep="\t", header=TRUE, quote = "", stringsAsFactors = FALSE, na.strings=c(""))

#limit to atlas portal
sens  <- sens[sens$PROJECT.CODE == "EBIRD_ATL_WI", ]

#delete uncodeds
sens <- sens %>%
  dplyr::filter(BREEDING.CATEGORY %in% c('C2', 'C3', 'C4'))

sens$OBSERVATION.DATE <- as.Date(sens$OBSERVATION.DATE)

#concatenate species and block
sens$SPECIESANDBLOCK <-  with(sens, paste0(COMMON.NAME, ATLAS.BLOCK))

# create duplicate of category field
sens$highestcat <- sens$BREEDING.CATEGORY

# remove C from category field to make a number
sens$highestcat<-gsub("C","",as.character(sens$highestcat))

# make new column numeric
sens$highestcat<-lapply(sens$highestcat,as.numeric)

#split into atas 1 and atlas 2
atlas1sens <- sens %>% filter(between(OBSERVATION.DATE, as.Date('1995-01-01'), as.Date('2000-12-31'))) # atlas 1
atlas2sens <- sens %>% filter(between(OBSERVATION.DATE, as.Date('2015-01-01'), as.Date('2019-12-31'))) # atlas 2

#and do the following twice, once for each atlas period
#now find the maximum breeding category for each species per block

#set as data table
group1 <- as.data.table(atlas1sens)
group2 <- as.data.table(atlas2sens)

#find the single highest category for the species
maxcats1 <- group1[group1[, .I[which.max(highestcat)], by=SPECIESANDBLOCK]$V1]
maxcats2 <- group2[group2[, .I[which.max(highestcat)], by=SPECIESANDBLOCK]$V1]

# won't write with column as a list
maxcats1 <- apply(maxcats1,2,as.character)
maxcats2 <- apply(maxcats2,2,as.character)

#Write out a csv file
write.csv(maxcats1, file= "WBBA1_sensitive_keepjustthehighestrecordperblock.csv", row.names=FALSE)
write.csv(maxcats2, file= "WBBA2_sensitive_keepjustthehighestrecordperblock.csv", row.names=FALSE)
