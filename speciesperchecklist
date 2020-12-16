#load file
ebird5 <- read.delim("ebd_US-WI_201501_201912_relOct-2020.txt", sep="\t", header=TRUE, quote = "", stringsAsFactors = FALSE, na.strings=c(""))

require("dplyr")

count <-ebird5 %>% count(SAMPLING.EVENT.IDENTIFIER, sort = TRUE)

write.csv(count, file = "sumspeciesperchecklist_dec2020.csv")
