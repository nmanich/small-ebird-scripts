# These taxa are about to change in eBird and have not yet been changed by AOS. To keep things in AOS taxonomy, then:

ebird$COMMON.NAME <- gsub("Western Cattle Egret", "Cattle Egret", ebird$COMMON.NAME)
ebird$COMMON.NAME <- gsub("Yellow-crowned Night Heron", "Yellow-crowned Night-Heron", ebird$COMMON.NAME)
ebird$COMMON.NAME <- gsub("Black-crowned Night Heron", "Black-crowned Night-Heron", ebird$COMMON.NAME)

To bring early 2023 file up to AOS taxonomy, then:

ebird$COMMON.NAME <- gsub("Northern Goshawk", "American Goshawk", ebird$COMMON.NAME)




