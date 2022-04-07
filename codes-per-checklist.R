#count the number of higher coded records on each checklist

require("dplyr")
require("tidyverse")

#load file
ebird <- read.delim("ebd_US-WI_199501_200012_relAug-2021.txt", sep="\t", header=TRUE, quote = "", stringsAsFactors = FALSE, na.strings=c(""))

#drops entire row if there is no breeding category
ebird2 <- ebird[!is.na(ebird$BREEDING.CATEGORY), ]

#drops rows with breeding category 1 (no code or F) 
ebird3 <-ebird2[!(ebird2$BREEDING.CATEGORY=="C1"),]

#so now all that is left are rows with higher codes

#add a new column with value of one in every row
ebird3$countmeup <-  1

#set up data frame for by-group processing (by checklist)  
basic_summ = group_by(ebird3, SAMPLING.EVENT.IDENTIFIER)

#calculate summary of codes by 
basic_summ = summarise(basic_summ, sum_amount = sum(countmeup))

basic_summ

write.csv(basic_summ, file = "sumcodedsperchecklist.csv")
