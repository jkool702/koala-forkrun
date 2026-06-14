#!/bin/bash

s2=$(mktemp -u)
s3=$(mktemp -u)

mkfifo $s2 $s3

tee $s2 |
    tail -n +2 |
    paste $s2 - |
    tee $s3 |
    cut -f 1 |
    tail -n +3 |
    paste $s3 - |
    sed "\$d" |
    sed "\$d"

rm $s2 $s3

