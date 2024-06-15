#!/bin/bash

git clone https://github.com/open-mmlab/mmdeploy.git

cd mmdeploy && git checkout $MMDEPLOY_CHECKOUT_TARGET

if [ $MMDEPLOY_BUILD_TYPE = "Debug" ]; then
    CFLAGS='-O0 -g' python setup.py install
fi

if [ $MMDEPLOY_BUILD_TYPE = "RelWithDebInfo" ]; then
    CFLAGS='-g' python setup.py install
fi

if [ $MMDEPLOY_BUILD_TYPE = "Release" ]; then
    CFLAGS='' python setup.py install
fi

cd .. && rm -rf mmdeploy

