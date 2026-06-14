#!/bin/bash

# 1.1: extract names and sort
# cat $1 | cut -d ' ' -f 2 | sort

# Using GNU parallel:
frun -j "$jobs" -s -b "$BLOCK_SIZE" -k "cut -d ' ' -f 2" < "$1" | sort