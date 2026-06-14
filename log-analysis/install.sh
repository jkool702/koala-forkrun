#!/bin/bash

pkgs="tcpdump curl wget coreutils diffutils gzip bcftools gawk unzip git"

for pkg in $pkgs; do
    if ! rpm -q "$pkg" &> /dev/null; then
        sudo dnf install -y --skip-unavailable "$pkg"
    fi
done
