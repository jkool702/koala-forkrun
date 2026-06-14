#!/bin/bash

source "$(git rev-parse --show-toplevel)/frun.bash"
# 1.3: sort top first names
# cat $1 | cut -d ' ' -f 1 | sort | uniq -c | sort -r

# Using GNU parallel:
frun -j "$jobs" -s -b "$BLOCK_SIZE" -k bash -c "cut -d ' ' -f 1" < "$1" | sort | uniq -c | sort -r