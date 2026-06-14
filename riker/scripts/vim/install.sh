#!/bin/bash

sudo dnf install --skip-unavailable -y git \
    gcc \
    make \
    ncurses-devel \
    libSM-devel \
    libICE-devel \
    libXt-devel \
    libX11-devel \
    libXdmcp-devel \
    libselinux-devel
