#!/bin/bash

git clone --recursive https://github.com/pytorch/pytorch.git
cd pytorch && git checkout $PYTORCH_VERSION && git submodule update --recursive --init

export BLAS=OpenBLAS
export TORCH_CUDA_ARCH_LIST="$TORCH_CUDA_ARCH"

python setup.py install

cd .. && rm -rf pytorch
