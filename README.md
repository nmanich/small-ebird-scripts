# small-ebird-scripts
Little scripts that split something off or summarize the big EBD download.

AOS_taxonomy - keeps my 2023/2024 files in line with current AOS taxonomy

code_discrepancies - Searching for a 4/2022 bug in how back-end breeding codes are changed in eBird

codes-per-checklist - Sums the number of higher coded records (i.e. not F) per checklist. Beware - will not catch hidden sensitive species.

column-name-fixing - Takes column names from UPPERCASE.SPACE.AS.PERIOD to snake_case and vice versa.

drop-outportaled-rows - You load in a file with submission IDs that you want out of the EBD, and this removes all rows matching those subIDs.

duplicate-locID-checker3 - Searches for point locations in eBird that map to more than one LocID (which can result in point locations not showing on the map).

eBird-checklist-collator - Takes downloaded ebird checklists (downloaded by the user from the checklist URL page) and loads them in bulk into a single csv.

exports-checklists-with-no-codes - This script searches for checklists with no codes on them and outputs all observtions from those checklists.

extract-rows - Simple way to pull out rows based on matching specific text in a column.

group-checklist-discrepancies - Checks for records on a shared group ID that are coded differently. 

input-and-output - Pinning different ways to input and output eBird data.

obsposs-extraction - Pulls out the joint observed/possible species for WBBA.

one-row-per-species-per-block - This cuts the EBD down to 1 row for each unique coded species per block.

replace-single-breeding-code - manual replacement of a single breeding code and category 

species-per-checklist - Returns the number of species on each checklist.

s-rank - Pulls specific species and certain columns, and outputs one csv per species.

sensitive_species_per_block - filters the records down to the single highest breeding category per block

split-by-county - Splits the download into separate files by county (could be modified to do a file per species, or any other column).

split-EBD-by-family - Splits the EBD download into separate csv files by bird family.

split-EBD-by-year - Splits the EBD download into separate csv files by year.

summing-observer-time - A pivot-table like script that sums birding time by observer.

tallying-block-categories-all-blocks - calculates the highest code per block and tallies up possible, probable, confirmed blocks for each species

tallying-block-categories-faircompare - calculates the highest code for just faircompare blocks and tallies up possible, probable, confirmed blocks for each species

unique-locations - This calculates the number of unique locations in the file.
