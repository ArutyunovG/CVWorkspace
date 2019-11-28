#!/bin/bash

git clone --recursive https://github.com/pytorch/vision.git
cd vision && git checkout master
python setup.py install
cd .. && rm -rf vision
