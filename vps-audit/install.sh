#!/bin/bash

pkgs="bash curl grep gawk iptables ufw procps net-tools fail2ban iproute2"

for pkg in $pkgs; do
    if ! rpm -q "$pkg" &> /dev/null; then
        sudo dnf install -y --skip-unavailable "$pkg"
    fi
done
