#!/bin/bash

git clone --recursive $DETECTRON2_URL
cd detectron2 && git checkout $DETECTRON2_CHECKOUT_TARGET

if [ -n "$DETECTRON2_PATCH" ]; then
    git apply $DETECTRON2_PATCH
fi

if [ $DETECTRON2_BUILD_TYPE = "Debug" ]; then
    CFLAGS='-O0 -g' python setup.py install
fi

if [ $DETECTRON2_BUILD_TYPE = "RelWithDebInfo" ]; then
    CFLAGS='-g' python setup.py install
fi

if [ $DETECTRON2_BUILD_TYPE = "Release" ]; then
    CFLAGS='' python setup.py install
fi

cd .. && rm -rf detectron2
