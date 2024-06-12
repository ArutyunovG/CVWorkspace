#!/bin/bash

git clone --recursive $PYTORCH_URL
cd pytorch && git checkout $PYTORCH_CHECKOUT_TARGET && git submodule update --recursive --init

if [ -n "$PYTORCH_PATCH" ]; then
    git apply $PYTORCH_PATCH
fi

if [ $PYTORCH_BUILD_TYPE = "Debug" ]; then
    export DEBUG=1
    export REL_WITH_DEB_INFO=0
fi

if [ $PYTORCH_BUILD_TYPE = "RelWithDebInfo" ]; then
    export DEBUG=0
    export REL_WITH_DEB_INFO=1
fi

if [ $PYTORCH_BUILD_TYPE = "Release" ]; then
    export DEBUG=0
    export REL_WITH_DEB_INFO=0
fi

export BLAS=OpenBLAS
export USE_MKLDNN=0
export USE_LAPACK=0
export TORCH_CUDA_ARCH_LIST="$TORCH_CUDA_ARCH"
export PYTHONPATH=$PYTHONPATH:$(pwd)

python setup.py install

cd .. && rm -rf pytorch
