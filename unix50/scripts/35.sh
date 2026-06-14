#!/bin/bash

source "$(git rev-parse --show-toplevel)/frun.bash"
# 11.1: year Ritchie and Thompson receive the Hamming medal
# cat $1 | grep 'UNIX' | cut -f 1

# Using frun:
frun -j "$jobs" -s -b "$BLOCK_SIZE" -k bash -c "grep 'UNIX' | cut -f 1" < "$1"