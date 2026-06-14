#!/bin/bash

pkgs="curl wget coreutils gzip gawk sed findutils git"

sudo dnf install --skip-unavailable -y $pkgs
