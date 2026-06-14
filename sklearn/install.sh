#!/bin/bash

TOP=$(git rev-parse --show-toplevel)
cd "$TOP"/sklearn || exit 1

# Skip pip install since we use pre-installed system packages from dnf
# python3-scipy, python3-scikit-learn, python3-numpy, python3-joblib are installed via dnf
exit 0
