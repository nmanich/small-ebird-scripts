#This assumes you have some dataframe (df) that you need to change the column headers on

#####################################################
#Case 1: From UPPERCASE.SPACE.AS.PERIOD to snake_case

names(df) <- tolower(names(df))

library(stringr) 

colnames(df) <- str_replace_all(colnames(df), "[:punct:]", "_")

#####################################################
#Case 2: From snake_case to UPPERCASE.SPACE.AS.PERIOD 

names(df) <- toupper(names(df))

library(stringr)   
colnames(df) <- str_replace_all(colnames(df), "[:punct:]", ".")

#####################################################
#Case 3: From snake_case to UPPERCASE.SPACE.AS.PERIOD where sp is a list function

sp <- lapply(sp, function (y) {colnames(y) <- gsub("\\_", "\\.", colnames(y)); y})
sp <- lapply(sp, function (x) dplyr::rename_with(x, toupper))
