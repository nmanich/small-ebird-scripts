# pulling data for SRank calculation
# limits to species, adjusts formatting, spits out one file per species

library(plyr) #for splitting
library(stringr) #for lowercase

# import EBD
ebird <- read.delim("ebd_US-WI-021_201501_201808_relMay-2018.txt", quote = "", as.is = TRUE)

# pull out only categories with codes
ebird <- ebird[grepl("C2|C3|C4"
                     , ebird$BREEDING.BIRD.ATLAS.CATEGORY), ]

# limit to just atlas data
ebird  <- ebird[ebird$PROJECT.CODE == "EBIRD_ATL_WI", ]

# pull out certain species (regular species)
BIRDS <- ebird[grepl("Sharp-shinned Hawk|Grasshopper Sparrow|LeConte's Sparrow|Nelson's Sparrow|Blue-winged Teal|American Black Duck|Eastern Whip-poor-will|Great Egret|Short-eared Owl|American Bittern|Common Goldeneye|Red-shouldered Hawk|Canada Warbler|Swainson's Thrush|Henslow's Sparrow|Lark Sparrow|Common Nighthawk|Northern Harrier|Evening Grosbeak|Black-billed Cuckoo|Northern Bobwhite|Olive-sided Flycatcher|Ruby-crowned Kinglet|Bobolink|Least Flycatcher|Acadian Flycatcher|Rusty Blackbird|Brewer's Blackbird|Peregrine Falcon|American Coot|Common Loon|Kentucky Warbler|Black-necked Stilt|Yellow-breasted Chat|Red-headed Woodpecker|Yellow-crowned Night-Heron|Black-crowned Night-Heron|Connecticut Warbler|Louisiana Waterthrush|Canada Jay|Wilson's Phalarope|Black-backed Woodpecker|Boreal Chickadee|Vesper Sparrow|Prothonotary Warbler|Bank Swallow|American Woodcock|Cerulean Warbler|Hooded Warbler|Dickcissel|Eastern Meadowlark|Western Meadowlark|Greater Prairie-Chicken|Golden-winged Warbler|Yellow-headed Blackbird"
, ebird$COMMON.NAME), ]

# pull out certain species (sensitive species)
#BIRDS <- ebird[grepl("Northern Goshawk|Long-eared Owl|King Rail|Sharp-tailed Grouse"
#                     , ebird$COMMON.NAME), ]

# limit to just species because slashes screw things up
BIRDS  <- BIRDS[BIRDS$CATEGORY == "species", ]

# pull out certain columns to format
BIRDS <- BIRDS[,c("GLOBAL.UNIQUE.IDENTIFIER", "COMMON.NAME", "LOCALITY", "LATITUDE", "LONGITUDE")]

# lowercase names
names(BIRDS) <- tolower(names(BIRDS))
colnames(BIRDS) <- str_replace_all(colnames(BIRDS), "[:punct:]", "_")

# split into separate csv files by species
d_ply(BIRDS, .(common_name),
      function(BIRDS) write.csv(BIRDS,
                                file=paste(BIRDS$common_name[[1]],".csv", sep=""), row.names=FALSE ))

