#!/bin/bash

source "$(git rev-parse --show-toplevel)/frun.bash"
# 8.1: count unix birth-year
# cat $1 | tr ' ' '\n' | grep 1969 | wc -l

# Using GNU parallel:
frun -j "$jobs" -s -b "$BLOCK_SIZE" -k bash -c "tr ' ' '\n' | grep 1969" < "$1" | wc -l