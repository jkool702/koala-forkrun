#!/bin/bash
# Calculate sort twice
source "$(git rev-parse --show-toplevel)/frun.bash"

# cat $1 | tr A-Z a-z | sort | sort -r

cat "$1" | frun -k -s -b "$BLOCK_SIZE" "tr A-Z a-z" | sort | sort -r
