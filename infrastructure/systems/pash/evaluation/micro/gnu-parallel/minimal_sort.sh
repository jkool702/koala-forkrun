#!/bin/bash
# cat $IN | tr A-Z a-z | sort
source "$(git rev-parse --show-toplevel)/frun.bash"
TEMP_C1="/tmp/{/}.out1"
mkfifo ${TEMP1}
printf '%s\n' $IN | frun -i "cat {} | tr A-Z a-z | sort > $TEMP_C1" & 
sort -m ${TEMP1}
rm ${TEMP1}
