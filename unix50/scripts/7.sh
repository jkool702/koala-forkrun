#!/bin/bash

# 4.1: find number of rounds
# cat $1 | tr ' ' '\n' | grep '\.' | wc -l

# Using GNU parallel:
frun -j "$jobs" -s -b "$BLOCK_SIZE" -k "tr ' ' '\n' | grep '\.'" < "$1" | wc -l