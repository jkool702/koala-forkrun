#!/bin/bash

source "$(git rev-parse --show-toplevel)/frun.bash"
# 8.3: find names of the four people most involved with unix
# cat $1 | grep '(' | cut -d '(' -f 2 | cut -d ')' -f 1 | head -n 1

# Using frun:
frun -j "$jobs" -s -b "$BLOCK_SIZE" -k "grep '(' | cut -d '(' -f 2 | cut -d ')' -f 1" < "$1" | head -n 1