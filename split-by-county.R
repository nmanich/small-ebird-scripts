#set working directory
# read in data, make sure filename is current download
ebird <- read.delim("ebd_US-WI_201506_201512_relDec-2018.txt", sep="\t", header=TRUE, quote = "", stringsAsFactors = FALSE, na.strings=c(""))

# this spits out a separate csv file for every county in the state. You could also make it spit out a separate file for each species. 
require("plyr")
d_ply(ebird, .(COUNTY),
      function(ebird) write.csv(ebird,
                              file=paste(ebird$COUNTY[[1]],".csv",sep="")))
