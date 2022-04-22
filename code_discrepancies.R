# Searching for a bug in eBird code review

# Load EBD
ebird2 <- read.delim("ebd_US-WI_201501_201912_relMar-2022.txt", sep="\t", header=TRUE, quote = "", stringsAsFactors = FALSE, na.strings=c(""))

# Load Changelist sent to eBird
# column 1 is GLOBAL.UNIQUE.IDENTIFIER
# column 2 is BRCODE (your intended changed breeding code)
# column 3 is CHGREASON (the reason you wanted the record changed)
changelist <- read.delim("changecodes_nearclean2.txt", sep="\t", header=TRUE, quote = "", stringsAsFactors = FALSE, na.strings=c(""))

# join changelist columns to eBird table
lookup <- changelist[, c("GLOBAL.UNIQUE.IDENTIFIER", "BRCODE","CHGREASON")]
ebird3 <- join(ebird2, lookup, by = "GLOBAL.UNIQUE.IDENTIFIER")

# cut the file down to just a few columns we care about
fewercolumns <- ebird3[, c("GLOBAL.UNIQUE.IDENTIFIER", "BREEDING.CODE", "BREEDING.CATEGORY", "BRCODE", "CHGREASON")]

# tag rows with NAs in the reason column
fewercolumns$BRCODE[is.na(fewercolumns$CHGREASON)] <- "TRUE"

# remove rows that don't apply to us
onlychangerows <- subset(fewercolumns, CHGREASON != "TRUE")

# row count may be different by a hair, presumably because not all sensitive species are in the EBD

#trim white space
onlychangerows$BREEDING.CODE <- trimws(onlychangerows$BREEDING.CODE)

# sort 
onlychangerows2  <- arrange(onlychangerows, BRCODE, BREEDING.CODE)

# create duplicate fields (so you can inspect the original fields)
onlychangerows2$BRCODECOPY <- onlychangerows2$BRCODE
onlychangerows2$BREEDING.CODECOPY <- onlychangerows2$BREEDING.CODE

# change blanks to NCs on the duplicate fields
onlychangerows2$BRCODECOPY[is.na(onlychangerows2$BRCODECOPY)] <- "NC"
onlychangerows2$BREEDING.CODECOPY[is.na(onlychangerows2$BREEDING.CODECOPY)] <- "FALSE"
# some were false, don't know why, making those NC too
onlychangerows2$BREEDING.CODECOPY <- gsub('FALSE', 'NC', onlychangerows2$BREEDING.CODECOPY)

# COMPARE intended breeding codes to current breeding codes
onlychangerows2$Are_codes_same <- as.character(onlychangerows2$BRCODECOPY) == as.character(onlychangerows2$BREEDING.CODECOPY)

# Sort by column that tells which codes are same
onlychangerows2  <- arrange(onlychangerows2, -Are_codes_same)

# Limit it to only the rows where the breeding code didn't match our intent
onlyfalserows <- subset(onlychangerows2, Are_codes_same != "TRUE")

#Write out a csv file
write.csv(onlyfalserows, file= "CodeDiscrepancies.csv", row.names=FALSE)
