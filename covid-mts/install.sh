#!/bin/bash

pkgs="coreutils curl gzip gawk sed git"

sudo dnf install --skip-unavailable -y $pkgs
