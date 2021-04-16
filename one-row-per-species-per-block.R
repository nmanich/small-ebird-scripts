#this trims the EBD down, saving just one row for each coded species per block

#load in file, this version is from auk, only atlas portal and only coded species
ebirddata <- read.delim("mar21_atlaswi_onlycodes.txt", sep="\t", header=TRUE, quote = "", stringsAsFactors = FALSE, na.strings=c(""))

#this removes the F codes - note at the moment there is an empty space after the f
datanof <- ebirddata[ebirddata$BREEDING.BIRD.ATLAS.CODE != "F ", ]

# concatenate species and block
datanof$SPECIESANDBLOCK <-  with(datanof, paste0(COMMON.NAME, ATLAS.BLOCK))

# keep only unique species and block
onerowforeachcodedspecieseachblock <- datanof[!duplicated(datanof$SPECIESANDBLOCK), ]

#export
write.csv(onerowforeachcodedspecieseachblock, file = "onelinespeciesperblock.csv")
