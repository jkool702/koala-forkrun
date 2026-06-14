#!/bin/bash

# 8.1: count unix birth-year
# cat $1 | tr ' ' '\n' | grep 1969 | wc -l

# Using GNU parallel:
frun -j "$jobs" -s -b "$BLOCK_SIZE" -k "tr ' ' '\n' | grep 1969" < "$1" | wc -l