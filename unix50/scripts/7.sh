#!/bin/bash

source "$(git rev-parse --show-toplevel)/frun.bash"
# 4.1: find number of rounds
# cat $1 | tr ' ' '\n' | grep '\.' | wc -l

# Using GNU parallel:
frun -j "$jobs" -s -b "$BLOCK_SIZE" -k bash -c "tr ' ' '\n' | grep '\.'" < "$1" | wc -l