#####Different methods to input and output data#####
#Just pinning for my own reference

### 3 different ways to Input eBird Data

# read in an EBD txt file (the original downloaded format):
ebird2 <- read.delim("ebd_US-WI_201501_201912_relJan-2022.txt", sep="\t", header=TRUE, quote = "", stringsAsFactors = FALSE, na.strings=c(""))

# read in an EBD format csv file (presumably spit out of something else):
ebird <- read.csv("ebd_US-WI_201501_201912_relJan-2022.csv")

# use auk to read in an EBD format txt file:
library(auk)
ebd <- read_ebd("ebd_US-WI_201501_201912_relJan-2022.txt", unique = FALSE, rollup = FALSE)


### 2 different formats to Output Data

#Write out a txt file
write.table(ebird, file='C:\\Users\\nicho\\Desktop\\Jan2022Database\\YourOutputFile.txt', sep = "\t", row.names = FALSE)

#Write out a csv file
write.csv(ebird, file= "YourOutputfile.csv", row.names=FALSE)
