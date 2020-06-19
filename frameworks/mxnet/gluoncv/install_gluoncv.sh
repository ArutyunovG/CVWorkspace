#!/bin/bash

git clone --recursive $GLUONCV_URL
cd gluon-cv && git checkout $GLUONCV_CHECKOUT_TARGET

if [ -n "$GLUONCV_PATCH" ]; then
    git apply $GLUONCV_PATCH
fi

cp -r . $LIBS_BASE/mxnet/gluoncv
echo 'export PYTHONPATH=$PYTHONPATH:$LIBS_BASE/mxnet/gluoncv' >> $SETUP_SCRIPT
cd .. && rm -rf gluon-cv
