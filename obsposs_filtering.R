# filter obsposs records
# i.e., O, H, S, records within obsposs window become obsposs (eBird breeding category 1.5)
# H and S records outside obsposs window are coded down to C1 NC
# Nicholas M. Anich 11/06/23

####  Beware of name changes to Western Cattle Egret, Forster's Tern, night herons################

library(tidyverse)

sp <- read.delim("WBBA2_ATLASWI_plussensitivepluszerocount_EBDMar2023_GOOD_082823.txt", quote = "", as.is = TRUE)

# lowercase to uppercase as needed
# From snake_case to UPPERCASE.SPACE.AS.PERIOD 
names(sp) <- toupper(names(sp))
library(stringr)   
colnames(sp) <- str_replace_all(colnames(sp), "[:punct:]", ".")

# limit to atlas portal records
sp <- subset(sp, PROJECT.CODE == "EBIRD_ATL_WI")

# make sure date is a date
sp$OBSERVATION.DATE <- as.Date(sp$OBSERVATION.DATE)

# make a second date column with all same year for filtering
sp$DATE2 <- sp$OBSERVATION.DATE

# make sure alternate date is a date
sp$DATE2 <- as.Date(sp$DATE2)

# make all of date2 2015
year(sp$DATE2) <- 2015

###### pull into three time windows, before obsposs, in obsposs, after obsposs (different for each species)
#sens <- sens %>% filter(between(observation_date, as.Date('1995-01-01'), as.Date('2000-12-31'))) # old code

out1 <- sp %>% filter(between(DATE2, as.Date('2015-01-01'), as.Date('2015-05-31')), COMMON.NAME == "Laughing Gull") 
out2 <- sp %>% filter(between(DATE2, as.Date('2015-07-16'), as.Date('2015-12-31')), COMMON.NAME == "Laughing Gull")
in1 <- sp %>% filter(between(DATE2, as.Date('2015-06-01'), as.Date('2015-07-15')), COMMON.NAME == "Laughing Gull") 

out3 <- sp %>% filter(between(DATE2, as.Date('2015-01-01'), as.Date('2015-05-31')), COMMON.NAME == "Spotted Sandpiper") 
out4 <- sp %>% filter(between(DATE2, as.Date('2015-08-01'), as.Date('2015-12-31')), COMMON.NAME == "Spotted Sandpiper")
in2 <- sp %>% filter(between(DATE2, as.Date('2015-06-01'), as.Date('2015-07-31')), COMMON.NAME == "Spotted Sandpiper") 

out5 <- sp %>% filter(between(DATE2, as.Date('2015-01-01'), as.Date('2015-05-14')), COMMON.NAME == "Ring-billed Gull") 
out6 <- sp %>% filter(between(DATE2, as.Date('2015-08-01'), as.Date('2015-12-31')), COMMON.NAME == "Ring-billed Gull") 
in3 <- sp %>% filter(between(DATE2, as.Date('2015-05-15'), as.Date('2015-07-31')), COMMON.NAME == "Ring-billed Gull") 

out7 <- sp %>% filter(between(DATE2, as.Date('2015-01-01'), as.Date('2015-05-14')), COMMON.NAME == "Herring Gull") 
out8 <- sp %>% filter(between(DATE2, as.Date('2015-08-01'), as.Date('2015-12-31')), COMMON.NAME == "Herring Gull")
in4 <- sp %>% filter(between(DATE2, as.Date('2015-05-15'), as.Date('2015-07-31')), COMMON.NAME == "Herring Gull") 

out9 <- sp %>% filter(between(DATE2, as.Date('2015-01-01'), as.Date('2015-05-14')), COMMON.NAME == "Great Black-backed Gull") 
out10 <- sp %>% filter(between(DATE2, as.Date('2015-08-01'), as.Date('2015-12-31')), COMMON.NAME == "Great Black-backed Gull")
in5 <- sp %>% filter(between(DATE2, as.Date('2015-05-15'), as.Date('2015-07-31')), COMMON.NAME == "Great Black-backed Gull") 

out11 <- sp %>% filter(between(DATE2, as.Date('2015-01-01'), as.Date('2015-06-07')), COMMON.NAME == "Caspian Tern") 
out12 <- sp %>% filter(between(DATE2, as.Date('2015-07-16'), as.Date('2015-12-31')), COMMON.NAME == "Caspian Tern")
in6 <- sp %>% filter(between(DATE2, as.Date('2015-06-08'), as.Date('2015-07-15')), COMMON.NAME == "Caspian Tern") 

out13 <- sp %>% filter(between(DATE2, as.Date('2015-01-01'), as.Date('2015-06-07')), COMMON.NAME == "Common Tern") 
out14 <- sp %>% filter(between(DATE2, as.Date('2015-08-01'), as.Date('2015-12-31')), COMMON.NAME == "Common Tern")
in7 <- sp %>% filter(between(DATE2, as.Date('2015-06-08'), as.Date('2015-07-31')), COMMON.NAME == "Common Tern") 

out15 <- sp %>% filter(between(DATE2, as.Date('2015-01-01'), as.Date('2015-05-31')), COMMON.NAME == "Forster's Tern") 
out16 <- sp %>% filter(between(DATE2, as.Date('2015-08-01'), as.Date('2015-12-31')), COMMON.NAME == "Forster's Tern")
in8 <- sp %>% filter(between(DATE2, as.Date('2015-06-01'), as.Date('2015-07-31')), COMMON.NAME == "Forster's Tern") 

out17 <- sp %>% filter(between(DATE2, as.Date('2015-01-01'), as.Date('2015-05-14')), COMMON.NAME == "Double-crested Cormorant") 
out18 <- sp %>% filter(between(DATE2, as.Date('2015-08-01'), as.Date('2015-12-31')), COMMON.NAME == "Double-crested Cormorant")
in9 <- sp %>% filter(between(DATE2, as.Date('2015-05-15'), as.Date('2015-07-31')), COMMON.NAME == "Double-crested Cormorant") 

out19 <- sp %>% filter(between(DATE2, as.Date('2015-01-01'), as.Date('2015-05-31')), COMMON.NAME == "American White Pelican") 
out20 <- sp %>% filter(between(DATE2, as.Date('2015-08-01'), as.Date('2015-12-31')), COMMON.NAME == "American White Pelican")
in10 <- sp %>% filter(between(DATE2, as.Date('2015-06-01'), as.Date('2015-07-31')), COMMON.NAME == "American White Pelican") 

out21 <- sp %>% filter(between(DATE2, as.Date('2015-01-01'), as.Date('2015-05-14')), COMMON.NAME == "Great Blue Heron") 
out22 <- sp %>% filter(between(DATE2, as.Date('2015-08-01'), as.Date('2015-12-31')), COMMON.NAME == "Great Blue Heron")
in11 <- sp %>% filter(between(DATE2, as.Date('2015-05-15'), as.Date('2015-07-31')), COMMON.NAME == "Great Blue Heron") 

out23 <- sp %>% filter(between(DATE2, as.Date('2015-01-01'), as.Date('2015-05-31')), COMMON.NAME == "Great Egret") 
out24 <- sp %>% filter(between(DATE2, as.Date('2015-08-01'), as.Date('2015-12-31')), COMMON.NAME == "Great Egret")
in12 <- sp %>% filter(between(DATE2, as.Date('2015-06-01'), as.Date('2015-07-31')), COMMON.NAME == "Great Egret") 

out25 <- sp %>% filter(between(DATE2, as.Date('2015-01-01'), as.Date('2015-05-31')), COMMON.NAME == "Snowy Egret") 
out26 <- sp %>% filter(between(DATE2, as.Date('2015-08-01'), as.Date('2015-12-31')), COMMON.NAME == "Snowy Egret")
in13 <- sp %>% filter(between(DATE2, as.Date('2015-06-01'), as.Date('2015-07-31')), COMMON.NAME == "Snowy Egret") 

out27 <- sp %>% filter(between(DATE2, as.Date('2015-01-01'), as.Date('2015-05-31')), COMMON.NAME == "Cattle Egret") 
out28 <- sp %>% filter(between(DATE2, as.Date('2015-08-01'), as.Date('2015-12-31')), COMMON.NAME == "Cattle Egret")
in14 <- sp %>% filter(between(DATE2, as.Date('2015-06-01'), as.Date('2015-07-31')), COMMON.NAME == "Cattle Egret") 

out29 <- sp %>% filter(between(DATE2, as.Date('2015-01-01'), as.Date('2015-05-31')), COMMON.NAME == "Black-crowned Night-Heron") 
out30 <- sp %>% filter(between(DATE2, as.Date('2015-08-01'), as.Date('2015-12-31')), COMMON.NAME == "Black-crowned Night-Heron")
in15 <- sp %>% filter(between(DATE2, as.Date('2015-06-01'), as.Date('2015-07-31')), COMMON.NAME == "Black-crowned Night-Heron") 

out31 <- sp %>% filter(between(DATE2, as.Date('2015-01-01'), as.Date('2015-05-31')), COMMON.NAME == "Yellow-crowned Night-Heron") 
out32 <- sp %>% filter(between(DATE2, as.Date('2015-08-01'), as.Date('2015-12-31')), COMMON.NAME == "Yellow-crowned Night-Heron")
in16 <- sp %>% filter(between(DATE2, as.Date('2015-06-01'), as.Date('2015-07-31')), COMMON.NAME == "Yellow-crowned Night-Heron") 

out33 <- sp %>% filter(between(DATE2, as.Date('2015-01-01'), as.Date('2015-05-31')), COMMON.NAME == "Turkey Vulture") 
out34 <- sp %>% filter(between(DATE2, as.Date('2015-08-16'), as.Date('2015-12-31')), COMMON.NAME == "Turkey Vulture")
in17 <- sp %>% filter(between(DATE2, as.Date('2015-06-01'), as.Date('2015-08-15')), COMMON.NAME == "Turkey Vulture") 

out35 <- sp %>% filter(between(DATE2, as.Date('2015-01-01'), as.Date('2015-05-31')), COMMON.NAME == "Bald Eagle") 
out36 <- sp %>% filter(between(DATE2, as.Date('2015-08-16'), as.Date('2015-12-31')), COMMON.NAME == "Bald Eagle")
in18 <- sp %>% filter(between(DATE2, as.Date('2015-06-01'), as.Date('2015-08-15')), COMMON.NAME == "Bald Eagle") 

out37 <- sp %>% filter(between(DATE2, as.Date('2015-01-01'), as.Date('2015-05-31')), COMMON.NAME == "Osprey") 
out38 <- sp %>% filter(between(DATE2, as.Date('2015-08-01'), as.Date('2015-12-31')), COMMON.NAME == "Osprey")
in19 <- sp %>% filter(between(DATE2, as.Date('2015-06-01'), as.Date('2015-07-31')), COMMON.NAME == "Osprey") 

#then add them together
  
# combine by row
allout <- rbind(out1, out2, out3, out4, out5, out6, out7, out8, out9, out10, out11, out12, out13, out14, out15, out16, out17,
                out18, out19, out20, out21, out22, out23, out24, out25, out26, out27, out28, out29, out30, out31, out32, out33,
                out34, out35, out36, out37, out38)

allin <- rbind(in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15, in16, in17, in18, in19)

# although really these records should get their own status code OP, category code 1.5 - because there is no H in this system,
# and because the block map code is already setup to print H, I'm just using H vs. O as the dichotomy we care about
# turning outs to no code and turning ins to H (although all Hs are really obsposs)
# and then the code for the block map will call H obsposs.

# NOTE: FOR POSTERITY, COULD ADD A FINAL STEP HERE WHERE POSSIBLE CODES DUPLICATE TO A NEW COLUMN AND ARE RENAMED WITH THEIR NEW OBSPOSS CODE

# remove white space 
allout$BREEDING.CODE <- trimws(allout$BREEDING.CODE)
allout$BREEDING.CATEGORY <- trimws(allout$BREEDING.CATEGORY)

# the outs will have H and S codes downgraded to no code and C1
allout$BREEDING.CATEGORY <-replace(allout$BREEDING.CATEGORY, allout$BREEDING.CATEGORY == "C2", "C1") 
allout$BREEDING.CODE <-replace(allout$BREEDING.CODE, allout$BREEDING.CODE == "S", "NC") 
allout$BREEDING.CODE <-replace(allout$BREEDING.CODE, allout$BREEDING.CODE == "H", "NC") 

# the ins will have uncoded records upgraded to H

# remove white space 
allin$BREEDING.CODE <- trimws(allin$BREEDING.CODE)
allin$BREEDING.CATEGORY <- trimws(allin$BREEDING.CATEGORY)

# the outs will have uncodeds upcoded to H and C2
allin$BREEDING.CATEGORY <-replace(allin$BREEDING.CATEGORY, allin$BREEDING.CATEGORY == "C1", "C2") 
allin$BREEDING.CATEGORY <-replace(allin$BREEDING.CATEGORY, allin$BREEDING.CATEGORY == "", "C2") 
allin$BREEDING.CODE <-replace(allin$BREEDING.CODE, allin$BREEDING.CODE == "", "H") 
allin$BREEDING.CODE <-replace(allin$BREEDING.CODE, allin$BREEDING.CODE == "F", "H") 
allin$BREEDING.CODE <-replace(allin$BREEDING.CODE, allin$BREEDING.CODE == "NC", "H") 

# add them back together
# this should be all the obsposs species
# with all H codes really being obsposs codes
obspossspecies <- rbind(allin, allout)

#Write out a csv file
write.csv(obspossspecies, file= "obsposs_species_withH_asobsposs_110923.csv", row.names=FALSE)
