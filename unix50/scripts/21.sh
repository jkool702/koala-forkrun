#!/bin/bash

source "$(git rev-parse --show-toplevel)/frun.bash"
# 8.4: find longest words without hyphens
# cat $1 | tr -c "[a-z][A-Z]" '\n' | sort | awk "length >= 16"

# Using frun:
frun -j "$jobs" -s -b "$BLOCK_SIZE" -k "tr -c '[a-z][A-Z]' '\n'" < "$1" | sort | awk 'length >= 16'
