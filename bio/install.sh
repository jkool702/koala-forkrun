#!/bin/bash

# Use system samtools from dnf instead of building broken 1.7 version
sudo dnf install -y --skip-unavailable samtools

echo "Samtools installed successfully"
