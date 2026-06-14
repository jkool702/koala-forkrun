#!/bin/bash

source "$(git rev-parse --show-toplevel)/frun.bash"
# 4.3: find pieces captured by Belle with a pawn
# cat $1 | tr ' ' '\n' | grep 'x' | grep '\.' | cut -d '.' -f 2 | grep -v '[KQRBN]' | wc -l

# Using GNU parallel:
frun -j "$jobs" -s -b "$BLOCK_SIZE" -k "tr ' ' '\n' | grep 'x' | grep '\.' | cut -d '.' -f 2 | grep -v '[KQRBN]'" < "$1" | wc -l