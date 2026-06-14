#!/bin/bash

source "$(git rev-parse --show-toplevel)/frun.bash"
mkdir -p "$2"

pure_func() {
    ffmpeg -y -i pipe:0 -f mp3 -ab 192000 pipe:1 2>/dev/null
}
export -f pure_func

export dest="$2"

find "$1" -type f | frun -i 'cat "{}" | pure_func > '"$dest"'/"$(basename "{}").mp3"'