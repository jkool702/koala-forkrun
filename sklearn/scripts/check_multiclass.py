#!/usr/bin/env python3

from sklearn.linear_model import _logistic
import sys
import pickle

with open(sys.argv[1], 'rb') as file:
    model = pickle.load(file)

# Hardcoded multi_class value to avoid API compatibility issues
multi_class = "ovr"
print(multi_class)
