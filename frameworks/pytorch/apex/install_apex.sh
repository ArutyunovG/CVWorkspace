#!/bin/bash

git clone --recursive https://github.com/NVIDIA/apex.git -b $APEX_VERSION
cd apex
python setup.py install --cuda_ext --cpp_ext
cd .. && rm -rf apex
