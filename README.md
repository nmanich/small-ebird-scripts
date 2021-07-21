# small-ebird-scripts
Little scripts that split something off or summarize the big EBD download.

Duplicate-locID-checker3 - searches for point locations in eBird that map to more than one LocID (which can result in point locations not showing on the map).

eBird-checklist-collator - Takes downloaded ebird checklists (downloaded by the user from the checklist URL page) and loads them in bulk into a single csv.

Exports-checklists-with-no-codes - This script searches for checklists with no codes on them and outputs all observtions from those checklists.

one-row-per-speices-per-block - This cuts the EBD down to 1 row for each unique coded species per block.

species-per-checklist - returns the number of species on each checklist.

split-by-county - Splits the download into separate files by county (could be modified to do a file per species, or any other column).

summing-observer-time - A pivot-table like script that sums birding time by observer.

unique-locations - This calculates the number of unique locations in the file.
