#!/bin/bash

source "$(git rev-parse --show-toplevel)/frun.bash"
# Using GNU parallel:

mkdir -p "$2"
mkdir -p outputs/img_convert.min

pure_func () {
    convert -resize 70% "-" "-"
}
export -f pure_func

export dest_dir="$2"

find "$1" -type f | frun -j "$(nproc)" -i \
    'cat "{}" | pure_func > '"$dest_dir"'/"$(basename "{}")"'