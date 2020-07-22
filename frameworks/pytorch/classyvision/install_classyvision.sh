#!/bin/bash

git clone $CLASSYVISION_URL
cd ClassyVision && git checkout $CLASSYVISION_CHECKOUT_TARGET

if [ -n "$CLASSYVISION_PATCH" ]; then
    git apply $CLASSYVISION_PATCH
fi

python -m pip install . && cd .. && rm -rf ClassyVision
