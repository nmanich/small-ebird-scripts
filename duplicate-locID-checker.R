# script for identifying point locations in eBird that are mapped to more than one LocID, meaning some observations may not be showing on pushpin map. 

require("pivottabler")

#load in file
ebirddata <- read.delim("hiddenlocsample2.txt", sep="\t", header=TRUE, quote = "", stringsAsFactors = FALSE, na.strings=c(""))

#concatenate lat and long into a single point location column
ebirddata$POINTLOCATION <-  with(ebirddata, paste0(LATITUDE, LONGITUDE))

#keep only unique locationids (you wind up with one row per each location)
uniquelocations <- ebirddata[!duplicated(ebirddata$LOCALITY.ID), ]


# OPTION 1: STOP HERE AND USE EXCEL TO PIVOTTABLE THIS TABLE:
write.csv(uniquelocations, file = "uniquelocations.csv")

# OPTION 2: THE BELOW CODE WORKS FOR SMALL FILES BUT HAS VERY LONG RUN TIMES ON BIG FILES:
#makes a pivottable
pt <- PivotTable$new()
pt$addData(uniquelocations)
pt$addColumnDataGroups("LOCALITY.ID")
pt$addRowDataGroups("POINTLOCATION")
pt$defineCalculation(calculationName="Count of Locality.ID at each point location", summariseExpression="n()")
pt$renderPivot()

#prints to xls, you'll have to point it to a directory. I ended up using just a folder called R off C because this was giving me write permission errors in other folders.
library(openxlsx)
wb <- createWorkbook(creator = Sys.getenv("USERNAME"))
addWorksheet(wb, "Data")
pt$writeToExcelWorksheet(wb=wb, wsName="Data", 
                         topRowNumber=2, leftMostColumnNumber=2, applyStyles=TRUE)
saveWorkbook(wb, file="C:\\R\\problemlocs.xlsx", overwrite = TRUE)


#For the end result, any location with more than 1 in the total column has more than 1 LocID (column label) mapped to the same point location. Should be small enough you can tinker with remaining results in excel.
