#!/bin/bash
# Match complex regular-expression over input
source "$(git rev-parse --show-toplevel)/frun.bash"

# cat $1 | tr A-Z a-z | grep '\(.\).*\1\(.\).*\2\(.\).*\3\(.\).*\4'

# using GNU parallel

cat "$1" | tr A-Z a-z | frun -s -k -b "$BLOCK_SIZE" "grep '\(.\).*\1\(.\).*\2\(.\).*\3\(.\).*\4'"
