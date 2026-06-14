#!/bin/bash

# 9.3: animal that used to decorate the Unix room
# cat $1 | cut -c 1-2 | tr -d '\n'

# Using GNU parallel:
frun -j "$jobs" -s -b "$BLOCK_SIZE" -k "cut -c 1-2" < "$1" | tr -d '\n'