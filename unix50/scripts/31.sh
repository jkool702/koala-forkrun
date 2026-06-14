#!/bin/bash

# 9.9:
# cat $1 | tr -c '[a-z][A-Z]' '\n' | grep '[A-Z]' | sed 1d | sed 1d | sed 2d | sed 3d | sed 5d | tr -c '[A-Z]' '\n' | tr -d '\n'

# Using GNU parallel:
frun -j "$jobs" -s -b "$BLOCK_SIZE" -k "tr -c '[a-z][A-Z]' '\n' | grep '[A-Z]'" < "$1"  | sed 1d | sed 1d | sed 2d | sed 3d | sed 5d | tr -c '[A-Z]' '\n' | tr -d '\n'