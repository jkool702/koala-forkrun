#!/bin/bash

pkgs='ffmpeg unrtf imagemagick libarchive-tools libncurses5-dev libncursesw5-dev zstd liblzma-dev libbz2-dev zip unzip nodejs tcpdump'

if ! command -v gpg >/dev/null; then
    sudo dnf install -y --skip-unavailable gpg
fi

for pkg in $pkgs; do
    if ! rpm -q "$pkg" >/dev/null 2>&1; then
        sudo dnf install -y --skip-unavailable "$pkg"
    fi
done
