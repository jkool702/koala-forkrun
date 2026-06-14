#!/bin/bash

source "$(git rev-parse --show-toplevel)/frun.bash"

mkdir -p "$2"
mkdir -p outputs/img_convert.min

pure_func () {
    convert -resize 70% "-" "-"
}
export -f pure_func
export FORKRUN_EXTRA_FUNCS="pure_func"
export dest_dir="$2"
export FORKRUN_EXTRA_VARS="dest_dir"

find "$1" -type f | frun -k -j "$(nproc)" -i \
    'cat "{}" | pure_func > '"$dest_dir"'/"$(basename "{}")"'
