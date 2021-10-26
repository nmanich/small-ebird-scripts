# Splits the EBD into separate csv files based on family


library(auk)  # needed for eBird taxonomy
library(plyr) # needed for vlookup type match

ebird <- read.delim("ebird_data_sample_wbbaii.txt", quote = "", as.is = TRUE)

# keep only portal records
ebirdatlas  <- ebird[ebird$PROJECT.CODE == "EBIRD_ATL_WI", ]

# eBird taxonomy needed to match up eBird range map with species
ebird_taxa <- get_ebird_taxonomy()

# narrow the taxonomy down to species and family
small_taxa_table <- ebird_taxa[, c("common_name","family")]

# change common name case to match
small_taxa_table2 <- colnames(small_taxa_table)[1] <- "COMMON.NAME"

# vlookup type join the family 
atlasdatawithfamily <- join(ebirdatlas, small_taxa_table, by = "COMMON.NAME")

# doublecheck all data got a family (should return FALSE)
anyNA(atlasdatawithfamily$family)

# splits EBD into separate files by family
d_ply(atlasdatawithfamily, .(family),
      function(atlasdatawithfamily) write.csv(atlasdatawithfamily,
                                file=paste(atlasdatawithfamily$family[[1]],".csv",sep="")))



