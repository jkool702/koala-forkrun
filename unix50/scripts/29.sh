#!/bin/bash

source "$(git rev-parse --show-toplevel)/frun.bash"
# 9.7: Four corners
# cat $1 | sed 2d | sed 2d | tr -c '[A-Z]' '\n' | tr -d '\n'

# Using frun:
cat $1 | sed 2d | sed 2d | frun -j "$jobs" -s -b "$BLOCK_SIZE" -k "tr -c '[A-Z]' '\n'" | tr -d '\n'
