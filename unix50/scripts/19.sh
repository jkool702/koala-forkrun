#!/bin/bash

source "$(git rev-parse --show-toplevel)/frun.bash"
# 8.2: find Bell Labs location where Dennis Ritchie had his office
# cat $1 | grep 'Bell' | awk 'length <= 45' | cut -d ',' -f 2 | awk "{\$1=\$1};1"

# Using GNU parallel:
frun -j "$jobs" -s -b "$BLOCK_SIZE" -k bash -c "grep 'Bell' | awk 'length <= 45' | cut -d ',' -f 2 | awk '{\$1=\$1};1'" < "$1"