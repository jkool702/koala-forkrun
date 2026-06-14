#!/bin/bash

pkgs="wget bsdmainutils file dos2unix"

for pkg in $pkgs; do
    if ! rpm -q "$pkg" >/dev/null 2>&1; then
        sudo dnf install -y --skip-unavailable "$pkg"
    fi
done
