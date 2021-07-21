#takes downloaded ebird checklists (downloaded by the user from the checklist URL page) and loads them in bulk into a single csv

library(dplyr)

#makes a list of filenames
file.list <- list.files(pattern='*.csv')

#loads the files in a batch
df.list <- sapply(file.list, read.csv, simplify=FALSE)

#brings them together in one dataframe
df <- bind_rows(df.list, .id = "id")

#exports as a single list
write.csv(df, "ebirdlists.csv")
