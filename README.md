# small-ebird-scripts
Little scripts that split something off or summarize the big EBD download.

codes-per-checklist - Sums the number of higher coded records (i.e. not F) per checklist. Beware - will not catch hidden sensitive species.

drop-outportaled-rows - You load in a file with submission IDs that you want out of the EBD, and this removes all rows matching those subIDs.

duplicate-locID-checker3 - Searches for point locations in eBird that map to more than one LocID (which can result in point locations not showing on the map).

eBird-checklist-collator - Takes downloaded ebird checklists (downloaded by the user from the checklist URL page) and loads them in bulk into a single csv.

exports-checklists-with-no-codes - This script searches for checklists with no codes on them and outputs all observtions from those checklists.

extract-rows - Simple way to pull out rows based on matching specific text in a column.

group-checklist-discrepancies - Checks for records on a shared group ID that are coded differently 

one-row-per-species-per-block - This cuts the EBD down to 1 row for each unique coded species per block.

species-per-checklist - Returns the number of species on each checklist.

split-by-county - Splits the download into separate files by county (could be modified to do a file per species, or any other column).

split-EBD-by-family - Splits the EBD download into separate csv files by bird family.

split-EBD-by-year - Splits the EBD download into separate csv files by year.

summing-observer-time - A pivot-table like script that sums birding time by observer.

unique-locations - This calculates the number of unique locations in the file.
