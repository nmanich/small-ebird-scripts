# Split an EBD file into multiple files, one for each year

require(lubridate)
require(tidyverse)
require(plyr)

# read in EBD file
ebird <- read.delim("ebd_US-WI_trokin_relJan-2022.txt", sep="\t", header=TRUE, quote = "", stringsAsFactors = FALSE, na.strings=c(""))

# duplicate the date column and class it as a date
ebird$newdate <- ymd(ebird$OBSERVATION.DATE)

# convert the new column to year
ebird$year <- format(ebird$newdate, format="%Y")

# split into separate csv files by year
d_ply(ebird, .(year),
      function(ebird) write.csv(ebird,
                              file=paste(ebird$year[[1]],".csv",sep="")))
