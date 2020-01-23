#!/bin/bash

TORCHVISION_VERSION=0.5.0

git clone --recursive https://github.com/pytorch/vision.git
cd vision && git checkout v$TORCHVISION_VERSION
python setup.py install
cd .. && rm -rf vision
