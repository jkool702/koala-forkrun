#!/bin/bash

source "$(git rev-parse --show-toplevel)/frun.bash"
# 9.1: extract the word PORT
# cat $1 | tr ' ' '\n' | grep '[A-Z]' | tr '[a-z]' '\n' | grep '[A-Z]' | tr -d '\n' | cut -c 1-4

# Using GNU parallel:
frun -j "$jobs" -s -b "$BLOCK_SIZE" -k bash -c "tr ' ' '\n' | grep '[A-Z]' | tr '[a-z]' '\n' | grep '[A-Z]'" < "$1" | tr -d '\n' | cut -c 1-4