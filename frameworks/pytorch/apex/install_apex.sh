#!/bin/bash

git clone --recursive $APEX_URL 
cd apex
git checkout $APEX_CHECKOUT_TARGET

if [ -n "$APEX_PATCH" ]; then
    git apply $APEX_PATCH
fi

python setup.py install --cuda_ext --cpp_ext
cd .. && rm -rf apex
