# super simple way to pull all rows that meet some condition

# import EBD
ebird <- read.delim("ebd_US-WI_201501_201912_relOct-2021.txt", quote = "", as.is = TRUE)

# pull out all bobwhite and pheasant rows
NOBORNEP <- ebird[grepl("Northern Bobwhite|Ring-necked Pheasant", ebird$COMMON.NAME), ]

# export to csv
write.csv(NOBORNEP, file= "Bobwhite_and_Pheasant.csv", row.names=FALSE)

