#!/bin/bash

source "$(git rev-parse --show-toplevel)/frun.bash"
# 7.3: all the decades in which a unix version was released
# cat $1 | cut -f 4 | sort -n | cut -c 3-3 | uniq | sed s/\$/'0s'/

# Using GNU parallel:
frun -j "$jobs" -s -b "$BLOCK_SIZE" -k bash -c "cut -f 4" < "$1" | sort -n | cut -c 3-3 | uniq | sed s/\$/'0s'/