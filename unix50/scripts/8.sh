#!/bin/bash

source "$(git rev-parse --show-toplevel)/frun.bash"
# 4.2: find pieces captured by Belle
# cat $1 | tr ' ' '\n' | grep 'x' | grep '\.' | wc -l

# Using GNU parallel:
frun -j "$jobs" -s -b "$BLOCK_SIZE" -k "tr ' ' '\n' | grep 'x' | grep '\.'" < "$1" | wc -l