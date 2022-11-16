#fixes a 2019 bug in the EBD that screwed up column names.
#load file from eBird
ebird4 <- read.delim("ebd_US-WI_201501_201909_relAug-2019.txt", sep="\t", header=TRUE, quote = "", stringsAsFactors = FALSE, na.strings=c(""))

# capitalize all column names
var.names<-toupper(colnames(ebird4))
               
#associate column names with variable names
colnames(ebird4)<-var.names

#export as tab separated text file - hopefully the same as ebird download
write.table(ebird4, "uppercase6.txt", append = FALSE, sep = "\t", dec = ".",
            row.names = FALSE, col.names = TRUE, quote = FALSE, na = "")
