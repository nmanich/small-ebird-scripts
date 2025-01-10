#summarizing and formatting block tables for WBBA book
# 12/17/24 Nick Anich with my typical remedial help from Gabriel birdnirdfoley

# The first step is summarizing the EBD using
# https://github.com/nmanich/small-ebird-scripts/blob/master/tallying-block-categories-faircompare.R
# https://github.com/nmanich/small-ebird-scripts/blob/master/tallying-block-categories-all-blocks.R
# and use those files to save a csv with the following columns
# common_name highestcat(number 2 through 4) numblocks_compareblocksatlas1 numblocks_compareblocksatlas2 numblocks_allblocksatlas1 numblocks_allblocksatlas2

# AFTER FINAL FILE IS AVAILABLE, TWEAK THIS AS NEEDED.

library(tidyverse)

# read in csv file 
blocktable<- read.csv("GOOD_DATA_FORRUN_FIXING_NOOBSPOSS_Better.csv")

print(blocktable)

# add percentage columns and round -----------------------------------------------
blocktable$perc_numblocks_compareblocksatlas1 <- blocktable$numblocks_compareblocksatlas1/(858)*100 #append a column with percentage
blocktable$perc_numblocks_compareblocksatlas1 <- round(blocktable$perc_numblocks_compareblocksatlas1, digits=1) #round


blocktable$perc_numblocks_compareblocksatlas2 <- blocktable$numblocks_compareblocksatlas2/(858)*100 #append a column with percentage
blocktable$perc_numblocks_compareblocksatlas2 <- round(blocktable$perc_numblocks_compareblocksatlas2, digits=1) #round


blocktable$perc_numblocks_allblocksatlas1 <- blocktable$numblocks_allblocksatlas1/(6644)*100 #append a column with percentage
blocktable$perc_numblocks_allblocksatlas1 <- round(blocktable$perc_numblocks_allblocksatlas1, digits=1) #round


blocktable$perc_numblocks_allblocksatlas2 <- blocktable$numblocks_allblocksatlas2/(6644)*100 #append a column with percentage
blocktable$perc_numblocks_allblocksatlas2 <- round(blocktable$perc_numblocks_allblocksatlas2, digits=1) #round

# add a total column --------------------------------------------------------------

birds_sum <- blocktable %>%
  group_by(common_name) %>%
  summarize(across(numblocks_compareblocksatlas1:perc_numblocks_allblocksatlas2, sum))
birds_sum <- birds_sum %>%
  mutate(col_order = 4)
blocktable <- blocktable %>%
  mutate(col_order = rep(c(1:3), 230))
blocktable <- bind_rows(blocktable, birds_sum) %>%
  arrange(common_name, col_order)

# replace NAs left in highest cat with a label that says total
  blocktable$highestcat <- as.character(blocktable$highestcat)
  blocktable$highestcat <- blocktable$highestcat %>% replace_na('Total')

# add percentage signs --------------------------------------------------------------
  
  blocktable$perc_numblocks_compareblocksatlas1 <-lapply(blocktable$perc_numblocks_compareblocksatlas1, function(x) paste0(x, "%"))
  blocktable$perc_numblocks_compareblocksatlas2 <-lapply(blocktable$perc_numblocks_compareblocksatlas2, function(x) paste0(x, "%"))
  blocktable$perc_numblocks_allblocksatlas1 <-lapply(blocktable$perc_numblocks_allblocksatlas1, function(x) paste0(x, "%"))
  blocktable$perc_numblocks_allblocksatlas2 <-lapply(blocktable$perc_numblocks_allblocksatlas2, function(x) paste0(x, "%"))
  
  # re-order the columns --------------------------------------------------------------
  blocktable <- 
  blocktable %>%
    dplyr::relocate(common_name, highestcat, numblocks_compareblocksatlas1, perc_numblocks_compareblocksatlas1, numblocks_compareblocksatlas2, perc_numblocks_compareblocksatlas2, numblocks_allblocksatlas1, perc_numblocks_allblocksatlas1, numblocks_allblocksatlas2, perc_numblocks_allblocksatlas2, col_order)
  
  # drop unneeded column
  blocktable$col_order <- NULL
  
  # rename values
  blocktable$highestcat <- gsub(fixed("2"), "Possible", blocktable$highestcat)
  blocktable$highestcat <- gsub(fixed("3"), "Probable", blocktable$highestcat)
  blocktable$highestcat <- gsub(fixed("4"), "Confirmed", blocktable$highestcat)

# set up list for loop
  unique_species <- unique(blocktable$common_name)

# some columns are lists, fix that  
  blocktable$perc_numblocks_compareblocksatlas1 <- unlist(blocktable$perc_numblocks_compareblocksatlas1)
  blocktable$perc_numblocks_compareblocksatlas2 <- unlist(blocktable$perc_numblocks_compareblocksatlas2)
  blocktable$perc_numblocks_allblocksatlas2 <- unlist(blocktable$perc_numblocks_allblocksatlas2)
  blocktable$perc_numblocks_allblocksatlas1 <- unlist(blocktable$perc_numblocks_allblocksatlas1)
  

#loop and print separate tables
for( i in unique_species){
  write.table(filter(blocktable , common_name == i ), file = paste0(i, '.csv'), row.names=F, col.names=T, sep=",")
}

