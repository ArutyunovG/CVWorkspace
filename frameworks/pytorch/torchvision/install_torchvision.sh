#!/bin/bash

git clone --recursive $TORCHVISION_URL
cd vision && git checkout $TORCHVISION_CHECKOUT_TARGET

if [ -n "$TORCHVISION_PATCH" ]; then
    git apply $TORCHVISION_PATCH
fi

python setup.py install
cd .. && rm -rf vision
