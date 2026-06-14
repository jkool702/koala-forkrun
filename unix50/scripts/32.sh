#!/bin/bash

source "$(git rev-parse --show-toplevel)/frun.bash"
# 10.1: count Turing award recipients while working at Bell Labs
# cat $1 | sed 1d | grep 'Bell' | cut -f 2 | wc -l

# Using frun:
cat $1 | sed 1d | frun -j "$jobs" -s -b "$BLOCK_SIZE" -k "grep 'Bell' | cut -f 2" | wc -l