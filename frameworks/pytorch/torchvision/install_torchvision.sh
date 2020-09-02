#!/bin/bash

git clone --recursive $TORCHVISION_URL
cd vision && git checkout $TORCHVISION_CHECKOUT_TARGET

if [ -n "$TORCHVISION_PATCH" ]; then
    git apply $TORCHVISION_PATCH
fi

if [ $TORCHVISION_BUILD_TYPE = "Debug" ]; then
    CFLAGS='-O0 -g' python setup.py install
fi

if [ $TORCHVISION_BUILD_TYPE = "RelWithDebInfo" ]; then
    CFLAGS='-g' python setup.py install
fi

if [ $TORCHVISION_BUILD_TYPE = "Release" ]; then
    CFLAGS='' python setup.py install
fi

cd .. && rm -rf vision
