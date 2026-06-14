#!/bin/bash
source "$(git rev-parse --show-toplevel)/frun.bash"
cd "$(realpath "$(dirname "$0")")" || exit 1

REPO_TOP=$(git rev-parse --show-toplevel)

# Download frun.bash from the forkrun repository
curl -sL https://raw.githubusercontent.com/jkool702/forkrun/main/frun.bash -o "$REPO_TOP/frun.bash"

sudo dnf install -y --skip-unavailable parallel git autoconf automake libtool build-essential cloc time gawk python3 python3-pip python3-venv
pip install --break-system-packages -r "$REPO_TOP/infrastructure/requirements.txt"
