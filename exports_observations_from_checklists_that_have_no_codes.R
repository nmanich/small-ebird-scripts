#This code outputs all observations with no codes
#Thanks to Nick Walton for this
#May want to filter by portal and also check for nocturnals

library(data.table)
library(parallel)

n_core <- detectCores() - 1
sp <- fread("forportalouttesting914to922SMALLCLEAN.txt", quote = "",
            nThread = n_core, check.names = TRUE)

no_code <- c("C1", "")
sp <- sp[sp[, if(all(BREEDING.BIRD.ATLAS.CATEGORY %in% no_code)) .I,
            by = SAMPLING.EVENT.IDENTIFIER]$V1]

fwrite(sp, file = "myfile.txt", sep = "\t", nThread = n_core)