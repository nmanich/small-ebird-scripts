#This script searches for checklists with no codes on them and outputs all observtions from those checklists
#Thanks to Nick Walton for this
#May want to filter by portal and also check for nocturnals

BEFORE CHECKING FOR CHECKLISTS WITH NO CODES, NEED TO MERGE IN SENSITIVE SPECIES, AND UN 0s!

# This version should work with the raw ebird txt file

library(data.table)
library(parallel)

n_core <- detectCores() - 1
sp <- fread("forportalouttesting914to922SMALLCLEAN.txt", quote = "",
            nThread = n_core, check.names = TRUE)

no_code <- c("C1", "")
sp <- sp[sp[, if(all(BREEDING.BIRD.ATLAS.CATEGORY %in% no_code)) .I,
            by = SAMPLING.EVENT.IDENTIFIER]$V1]

fwrite(sp, file = "myfile.txt", sep = "\t", nThread = n_core)

# This version should work with the postgres csv output

library(data.table)
library(parallel)

n_core <- detectCores() - 1
sp <- fread("ALLATLASWISEPT19_2.csv", sep = ",",
            nThread = n_core, check.names = TRUE)

no_code <- c("C1", "")
sp <- sp[sp[, if(all(breeding_bird_atlas_category %in% no_code)) .I,
            by = sampling_event_identifier]$V1]

fwrite(sp, file = "ALLATLASWISEPT19_6.txt", sep = "\t", nThread = n_core)



