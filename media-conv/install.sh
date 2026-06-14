#!/bin/bash

pkgs="curl wget unzip gzip coreutils ffmpeg unrtf imagemagick zstd git xz-utils"

for pkg in $pkgs; do
    if ! rpm -q "$pkg" &> /dev/null; then
        sudo dnf install -y --skip-unavailable "$pkg"
    fi
done
