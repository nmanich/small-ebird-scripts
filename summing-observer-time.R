  
#set working directory

#load file
ebird4 <- read.delim("ebd_US-WI-043_201501_201901_relNov-2018.txt", sep="\t", header=TRUE, quote = "", stringsAsFactors = FALSE, na.strings=c(""))

require("dplyr")

# replace NA with 0
ebird4[is.na(ebird3)] <- 0

#not sure if this is needed or not, but it works
thedata <- as_tibble(ebird4)

#remove duplicate rows, keep one from each checklist
nowwithfewer <- thedata[!duplicated(thedata$SAMPLING.EVENT.IDENTIFIER), ]

#set up data frame for by-group processing (by observer)  
basic_summ = group_by(nowwithfewer, OBSERVER.ID)
 
#calculate summary of minutes by 
basic_summ = summarise(basic_summ, sum_amount = sum(DURATION.MINUTES))
 
basic_summ

write.csv(basic_summ, file = "sumhoursgrant.csv")
