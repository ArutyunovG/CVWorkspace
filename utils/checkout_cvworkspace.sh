#!/bin/bash

: ${CVWORKSPACE_CHECKOUT_TARGET:=}
: ${CVWORKSPACE_PATCH:=}

if [ -n "$CVWORKSPACE_CHECKOUT_TARGET" ]; then
    git fetch --all
    git checkout $CVWORKSPACE_CHECKOUT_TARGET
    git pull
fi

if [ -n "$CVWORKSPACE_PATCH" ]; then
    git apply $CVWORKSPACE_PATCH
fi
