# pulling out WI SGCN species

# import EBD
ebird <- read.delim("WBBA2_ATLASWI_plussensitivepluszerocount_EBDMar2023_GOOD_111725.txt", quote = "", as.is = TRUE)

# filter to SGCN
# note that 5 THR species may leave in future
# Some names may have changed:
# This uses Northern Goshawk
# This uses Black-crowned Night-Heron
# This uses Yellow-crowned Night-Heron
# This uses Great Egret
SGCN <- ebird[grepl("American Black Duck|Common Goldeneye|Sharp-tailed Grouse|Greater Prairie-Chicken|Spruce Grouse|Common Nighthawk|Eastern Whip-poor-will|King Rail|Yellow Rail|Whooping Crane|Black-necked Stilt|Piping Plover|Upland Sandpiper|Wilson's Phalarope|Caspian Tern|Black Tern|Forster's Tern|Common Tern|Red-necked Grebe|Black-crowned Night-Heron|Northern Goshawk|Long-eared Owl|Short-eared Owl|Black-backed Woodpecker|Peregrine Falcon|Olive-sided Flycatcher|Bell's Vireo|Loggerhead Shrike|Canada Jay|Boreal Chickadee|Ruby-crowned Kinglet|Swainson's Thrush|Evening Grosbeak|Grasshopper Sparrow|LeConte's Sparrow|Nelson's Sparrow|Henslow's Sparrow|Yellow-breasted Chat|Yellow-headed Blackbird|Western Meadowlark|Eastern Meadowlark|Brewer's Blackbird|Worm-eating Warbler|Golden-winged Warbler|Connecticut Warbler|Kentucky Warbler|Kirtland's Warbler|Cerulean Warbler|Yellow-throated Warbler|Yellow-crowned Night-Heron|Great Egret|Red-shouldered Hawk|Acadian Flycatcher|Hooded Warbler", ebird$COMMON.NAME), ]

# export to csv
write.csv(SGCN, file= "2026SGCN.csv", row.names=FALSE)


#SHORTER VARIANT MINUS 5 SPP
SGCNminus5 <- ebird[grepl("American Black Duck|Common Goldeneye|Sharp-tailed Grouse|Greater Prairie-Chicken|Spruce Grouse|Common Nighthawk|Eastern Whip-poor-will|King Rail|Yellow Rail|Whooping Crane|Black-necked Stilt|Piping Plover|Upland Sandpiper|Wilson's Phalarope|Caspian Tern|Black Tern|Forster's Tern|Common Tern|Red-necked Grebe|Black-crowned Night-Heron|Northern Goshawk|Long-eared Owl|Short-eared Owl|Black-backed Woodpecker|Peregrine Falcon|Olive-sided Flycatcher|Bell's Vireo|Loggerhead Shrike|Canada Jay|Boreal Chickadee|Ruby-crowned Kinglet|Swainson's Thrush|Evening Grosbeak|Grasshopper Sparrow|LeConte's Sparrow|Nelson's Sparrow|Henslow's Sparrow|Yellow-breasted Chat|Yellow-headed Blackbird|Western Meadowlark|Eastern Meadowlark|Brewer's Blackbird|Worm-eating Warbler|Golden-winged Warbler|Connecticut Warbler|Kentucky Warbler|Kirtland's Warbler|Cerulean Warbler|Yellow-throated Warbler", ebird$COMMON.NAME), ]

# export to csv
write.csv(SGCN, file= "2026SGCNminus5.csv", row.names=FALSE)

