#!/bin/bash

git clone --recursive https://github.com/pytorch/pytorch.git
cd pytorch && git checkout 1.3.0 && git submodule update --recursive --init

export BLAS=OpenBLAS
export TORCH_CUDA_ARCH_LIST="$TORCH_CUDA_ARCH"

python setup.py install

cd .. && rm -rf pytorch
