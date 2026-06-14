#!/bin/bash

source "$(git rev-parse --show-toplevel)/frun.bash"
# 7.1: identify number of AT&T unix versions
# cat $1 | cut -f 1 | grep 'AT&T' | wc -l

# Using GNU parallel:
frun -j "$jobs" -s -b "$BLOCK_SIZE" -k "cut -f 1 | grep 'AT&T'" < "$1" | wc -l