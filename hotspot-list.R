#Pull the full list of hotspots for a region from the eBird API, which includes frequency of hotspot use

#First get a key for the API: https://ebird.org/api/keygen

install.packages("rebird")
library(rebird)

hotspots <- ebirdhotspotlist("US-WI", key = "YOURKEYHERE")

#Write out a csv file
write.csv(hotspots, file= "WIHotspots.csv", row.names=FALSE)




