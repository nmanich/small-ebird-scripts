#This pulls the obsposs species from the atlas data.

# import EBD
ebird <- read.delim("ebd_US-WI_199501_200012_relJul-2022.txt", quote = "", as.is = TRUE)

# pull out all obsposs species
OBSPOSS2 <- ebird[grepl("Spotted Sandpiper|Laughing Gull|Ring-billed Gull|Herring Gull|Great Black-backed Gull|Forster's Tern|Common Tern|Caspian Tern|Double-crested Cormorant|American White Pelican|Turkey Vulture|Osprey|Bald Eagle|Great Blue Heron|Great Egret|Snowy Egret|Cattle Egret|Black-crowned Night-Heron|Yellow-crowned Night-Heron", ebird$COMMON.NAME), ]

# limit to just atlas data
OBSPOSS2  <- OBSPOSS2[OBSPOSS2$PROJECT.CODE == "EBIRD_ATL_WI", ]

# OPTIONAL: remove uncoded, F, and S/H records.
# OBSPOSS3 <- subset(OBSPOSS2, BREEDING.CATEGORY != "C1")
# OBSPOSS4 <- subset(OBSPOSS3, BREEDING.CATEGORY != "C2")
# OBSPOSS5 <- subset(OBSPOSS4, BREEDING.CATEGORY != "")

# export to csv
write.csv(OBSPOSS2, file= "OBSPOSS_WBBA1_GOOD.csv", row.names=FALSE)
