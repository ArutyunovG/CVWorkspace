#!/bin/bash

git clone --recursive $PYTORCH_URL
cd pytorch && git checkout $PYTORCH_CHECKOUT_TARGET && git submodule update --recursive --init

if [ -n "$PYTORCH_PATCH" ]; then
    git apply $PYTORCH_PATCH
fi

if [ $PYTORCH_BUILD_TYPE = "Debug" ]; then
    export DEBUG=1
fi

if [ $PYTORCH_BUILD_TYPE = "RelWithDebInfo" ]; then
    export REL_WITH_DEB_INFO=1
fi

export BLAS=OpenBLAS
export TORCH_CUDA_ARCH_LIST="$TORCH_CUDA_ARCH"

python setup.py install

cd .. && rm -rf pytorch
