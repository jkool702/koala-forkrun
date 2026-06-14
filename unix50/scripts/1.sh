#!/bin/bash

source "$(git rev-parse --show-toplevel)/frun.bash"
# 1.0: extract the last name
# cat $1 | cut -d ' ' -f 2

# Using GNU parallel:
frun -j "$jobs" -s -b "$BLOCK_SIZE" -k "cut -d ' ' -f 2" < "$1"