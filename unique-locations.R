  
#set working directory

#cut dataset to atlas data only if needed?

library(tidyverse)

#load ebird data
ebird4 <- read.delim("ebd_US-WI_amwpel_201501_201608_relAug-2016.txt", sep="\t", header=TRUE, quote = "", stringsAsFactors = FALSE, na.strings=c(""))

#convert to tibble
ebird5 <- as_tibble(ebird4)

#remove rows with duplicated locations, leaving a file with only unique locations
nowwithfewer <- ebird5[!duplicated(ebird5$LOCALITY.ID), ]

#export file to csv
write.csv(nowwithfewer, file = "uniquepelicans2.csv")
