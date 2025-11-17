
# script for manually updating breeding code (and category) in the large final version of atlas database

## MAKE SURE YOU ARE LOADING MOST RECENT VERSION
ebird<- read.delim("WBBA2_ATLASWI_plussensitivepluszerocount_EBDMar2023_GOOD_092525.txt", sep="\t", header=TRUE, quote = "", stringsAsFactors = FALSE, na.strings=c(""), fileEncoding = "latin1")
library(TAF)
file.encoding("WBBA2_ATLASWI_plussensitivepluszerocount_EBDMar2023_GOOD_092525.txt")
(gc)

#manually enter obs id and then breeding code and category

ebird$breeding_code[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS779841114"]<-""
ebird$breeding_code[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS769982009"]<-""
ebird$breeding_code[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS770548916"]<-""
ebird$breeding_code[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS516496238"]<-""
ebird$breeding_code[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS606717108"]<-""
ebird$breeding_code[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS328954161"]<-""
ebird$breeding_code[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS512894257"]<-""
ebird$breeding_code[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS645588436"]<-""
ebird$breeding_code[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS642488281"]<-""
ebird$breeding_code[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS640357842"]<-""
ebird$breeding_code[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS323060306"]<-""
ebird$breeding_code[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS635594102"]<-""
ebird$breeding_code[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS328954162"]<-""
ebird$breeding_code[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS634273457"]<-""
ebird$breeding_code[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS636981044"]<-""
ebird$breeding_code[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS789841542"]<-""
ebird$breeding_code[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS1113732535"]<-""
ebird$breeding_code[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS388565821"]<-"UN"
ebird$breeding_code[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS388565822"]<-"UN"
ebird$breeding_code[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS628181685"]<-"H"
ebird$breeding_code[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS1113783914"]<-"H"
ebird$breeding_code[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS775856967"]<-"UN"
ebird$breeding_code[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS777193720"]<-"FL"
ebird$breeding_code[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS435716396"]<-"UN"
ebird$breeding_code[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS391302373"]<-"N"
ebird$breeding_code[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS612980617"]<-"NB"
ebird$breeding_code[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS805934667"]<-""

ebird$breeding_code[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS425448441"]<-"S7"
ebird$breeding_code[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS514325925"]<-"S"
ebird$breeding_code[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS415610738"]<-"S7"

ebird$breeding_category[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS779841114"]<-"C1"
ebird$breeding_category[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS769982009"]<-"C1"
ebird$breeding_category[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS770548916"]<-"C1"
ebird$breeding_category[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS516496238"]<-"C1"
ebird$breeding_category[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS606717108"]<-"C1"
ebird$breeding_category[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS328954161"]<-"C1"
ebird$breeding_category[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS512894257"]<-"C1"
ebird$breeding_category[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS645588436"]<-"C1"
ebird$breeding_category[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS642488281"]<-"C1"
ebird$breeding_category[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS640357842"]<-"C1"
ebird$breeding_category[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS323060306"]<-"C1"
ebird$breeding_category[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS635594102"]<-"C1"
ebird$breeding_category[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS328954162"]<-"C1"
ebird$breeding_category[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS634273457"]<-"C1"
ebird$breeding_category[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS636981044"]<-"C1"
ebird$breeding_category[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS789841542"]<-"C1"
ebird$breeding_category[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS1113732535"]<-"C1"
ebird$breeding_category[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS388565821"]<-"C4"
ebird$breeding_category[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS388565822"]<-"C4"
ebird$breeding_category[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS628181685"]<-"C2"
ebird$breeding_category[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS1113783914"]<-"C2"
ebird$breeding_category[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS775856967"]<-"C4"
ebird$breeding_category[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS777193720"]<-"C4"
ebird$breeding_category[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS435716396"]<-"C4"
ebird$breeding_category[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS391302373"]<-"C3"
ebird$breeding_category[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS612980617"]<-"C4"
ebird$breeding_category[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS805934667"]<-"C1"


ebird$breeding_category[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS425448441"]<-"C3"
ebird$breeding_category[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS514325925"]<-"C2"
ebird$breeding_category[ebird$global_unique_identifier =="URN:CornellLabOfOrnithology:EBIRD:OBS415610738"]<-"C3"


# this checks all records (manually enter obsid)
#TESTING <- ebird[grepl("URN:CornellLabOfOrnithology:EBIRD:OBS415610738|URN:CornellLabOfOrnithology:EBIRD:OBS514325925|URN:CornellLabOfOrnithology:EBIRD:OBS425448441|URN:CornellLabOfOrnithology:EBIRD:OBS779841114|URN:CornellLabOfOrnithology:EBIRD:OBS769982009|URN:CornellLabOfOrnithology:EBIRD:OBS770548916|URN:CornellLabOfOrnithology:EBIRD:OBS516496238|URN:CornellLabOfOrnithology:EBIRD:OBS606717108|URN:CornellLabOfOrnithology:EBIRD:OBS328954161|URN:CornellLabOfOrnithology:EBIRD:OBS512894257|URN:CornellLabOfOrnithology:EBIRD:OBS645588436|URN:CornellLabOfOrnithology:EBIRD:OBS642488281|URN:CornellLabOfOrnithology:EBIRD:OBS640357842|URN:CornellLabOfOrnithology:EBIRD:OBS323060306|URN:CornellLabOfOrnithology:EBIRD:OBS635594102|URN:CornellLabOfOrnithology:EBIRD:OBS328954162|URN:CornellLabOfOrnithology:EBIRD:OBS634273457|URN:CornellLabOfOrnithology:EBIRD:OBS636981044|URN:CornellLabOfOrnithology:EBIRD:OBS789841542|URN:CornellLabOfOrnithology:EBIRD:OBS1113732535|URN:CornellLabOfOrnithology:EBIRD:OBS388565821|URN:CornellLabOfOrnithology:EBIRD:OBS388565822|URN:CornellLabOfOrnithology:EBIRD:OBS628181685|URN:CornellLabOfOrnithology:EBIRD:OBS1113783914|URN:CornellLabOfOrnithology:EBIRD:OBS775856967|URN:CornellLabOfOrnithology:EBIRD:OBS777193720|URN:CornellLabOfOrnithology:EBIRD:OBS435716396|URN:CornellLabOfOrnithology:EBIRD:OBS391302373|URN:CornellLabOfOrnithology:EBIRD:OBS612980617|URN:CornellLabOfOrnithology:EBIRD:OBS805934667", ebird$global_unique_identifier), ]

# optional export new records to csv
#write.csv(TESTING, file= "test4.csv", row.names=FALSE)

#this outputs a new clean database
library(pgirmess)
write.delim(ebird, file = "WBBA2_ATLASWI_plussensitivepluszerocount_EBDMar2023_GOOD_111725.txt", sep="\t")
(gc)

(gc)
# this tests for differences in the two versions
library(tidyr)
library(dplyr)
# RELOAD NEW VERSION YOU JUST MADE
ebird2<- read.delim("WBBA2_ATLASWI_plussensitivepluszerocount_EBDMar2023_GOOD_111725.txt", sep="\t", header=TRUE, quote = "", stringsAsFactors = FALSE, na.strings=c(""), fileEncoding = "latin1")
# REIMPORT ORIGINAL FILE (CHANGE SOURCE DATA)
ebird<- read.delim("WBBA2_ATLASWI_plussensitivepluszerocount_EBDMar2023_GOOD_092525.txt", sep="\t", header=TRUE, quote = "", stringsAsFactors = FALSE, na.strings=c(""), fileEncoding = "latin1")
#make concatenated column for checking
ebird2 = ebird2 %>% 
  unite(combined, global_unique_identifier, breeding_code, sep = "_", remove = FALSE)
ebird = ebird %>% 
  unite(combined, global_unique_identifier, breeding_code, sep = "_", remove = FALSE)

#rows from original that changed
anti_join_original <- anti_join(ebird, ebird2, by = "combined")
#rows from 2 that changed
anti_join_new <- anti_join(ebird2, ebird, by = "combined")

