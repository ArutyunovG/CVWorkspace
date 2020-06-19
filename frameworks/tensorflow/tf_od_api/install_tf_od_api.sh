#!/bin/bash

git clone $TF_OD_API_URL 
cd models && git checkout $TF_OD_API_CHECKOUT_TARGET

if [ -n "$TF_OD_API_PATCH" ]; then
    git apply $TF_OD_API_PATCH
fi

cd ..

cd models/research
protoc object_detection/protos/*.proto --python_out=.
cd ../..
cp -r models $LIBS_BASE/tensorflow
rm -rf models

echo 'export PYTHONPATH=$PYTHONPATH:$LIBS_BASE/tensorflow/models/research:$LIBS_BASE/tensorflow/models/research/slim' >> $SETUP_SCRIPT
