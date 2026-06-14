#!/bin/bash
# Hours each bus is active each day
source "$(git rev-parse --show-toplevel)/frun.bash"
sed_chunk() {
    sed 's/T\(..\):..:../,\1/'
}
export -f sed_chunk

frun -k -s -b "$chunk_size" sed_chunk < "$1" > temp_sed_output.txt
awk -F, '
!seen[$1 $2 $4] { seen[$1 $2 $4] = 1; hours[$1 $4]++; bus[$4] = 1; day[$1] = 1; }
END {
   PROCINFO["sorted_in"] = "@ind_str_asc"
   for (d in day)
     printf("\t%s", d);
   printf("\n");
   for (b in bus) {
     printf("%s", b);
     for (d in day)
       printf("\t%s", hours[d b]);
     printf("\n");
   }
}' temp_sed_output.txt

rm -rf temp_sed_output.txt