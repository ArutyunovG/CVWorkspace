#!/bin/bash

git clone --recursive $DETECTRON2_URL
cd detectron2 && git checkout $DETECTRON2_CHECKOUT_TARGET

if [ -n "$DETECTRON2_PATCH" ]; then
    git apply $DETECTRON2_PATCH
fi

if [ $DETECTRON2_BUILD_TYPE = "Debug" ]; then
    CFLAGS='-O0 -g' python -m pip install --editable .
fi

if [ $DETECTRON2_BUILD_TYPE = "RelWithDebInfo" ]; then
    CFLAGS='-g' python -m pip install --editable .
fi

if [ $DETECTRON2_BUILD_TYPE = "Release" ]; then
    CFLAGS='' python -m pip install --editable .
fi

cd .. && mkdir -p $LIBS_BASE/pytorch && mv detectron2 $LIBS_BASE/pytorch/detectron2

echo 'export PYTHONPATH=$PYTHONPATH:$LIBS_BASE/pytorch/detectron2' >> $SETUP_SCRIPT
