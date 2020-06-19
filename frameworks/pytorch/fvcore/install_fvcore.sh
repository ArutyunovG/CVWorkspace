#!/bin/bash

git clone $FVCORE_URL
cd fvcore && git checkout $FVCORE_CHECKOUT_TARGET

if [ -n "$FVCORE_PATCH" ]; then
    git apply $FVCORE_PATCH
fi

python -m pip install . && cd .. && rm -rf fvcore
