#!/bin/bash

source "$(git rev-parse --show-toplevel)/frun.bash"
# 3.1: get lowercase first letter of last names (awk)
# cat $1 | cut -d ' ' -f 2 | cut -c 1-1 | tr -d '\n' | tr '[A-Z]' '[a-z]'

# Using GNU parallel:
frun -j "$jobs" -s -b "$BLOCK_SIZE" -k bash -c "cut -d ' ' -f 2 | cut -c 1-1" < "$1" | tr -d '\n' | tr '[A-Z]' '[a-z]'
