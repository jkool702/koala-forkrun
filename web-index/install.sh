#!/usr/bin/env bash

pkgs="p7zip-full curl wget unzip npm"

for pkg in $pkgs; do
  if ! rpm -q "$pkg" > /dev/null 2>&1 ; then
    sudo dnf install -y --skip-unavailable "$pkg"
  fi
done

# Install pandoc if not installed
if ! rpm -q pandoc > /dev/null 2>&1 ; then
  # since pandoc v.2.2.1 does not support arm64, we use v.3.5
  arch=$(uname -m)
  wget https://github.com/jgm/pandoc/releases/download/3.5/pandoc-3.5-1-"${arch}".rpm
  sudo dnf install -y --skip-unavailable pandoc-3.5-1-"${arch}".rpm
  rm pandoc-3.5-1-"${arch}".rpm
fi

# Install Node.js (18.x) and npm via NodeSource
if ! command -v node > /dev/null 2>&1 ; then
  curl -fsSL https://rpm.nodesource.com/setup_18.x | sudo -E bash -
  sudo dnf install -y --skip-unavailable nodejs
fi

# Verify node and npm installation
if ! command -v node > /dev/null 2>&1 ; then
  echo "Node.js installation failed."
  exit 1
fi
# if ! command -v npm > /dev/null 2>&1 ; then
#   echo "npm installation failed."
#   exit 1
# fi

if ! rpm -q nodejs > /dev/null 2>&1 ; then
    # node version 18+ does not need external npm
    curl -fsSL https://rpm.nodesource.com/setup_18.x | sudo -E bash -
    sudo dnf install -y --skip-unavailable nodejs
fi

cd "$(dirname "$0")/scripts" || exit 1
if [ ! -f package.json ]; then
  echo "package.json not found!"
  exit 1
fi
npm install

cd -  || exit 1
