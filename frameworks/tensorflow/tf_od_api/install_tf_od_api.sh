#!/bin/bash

git clone https://github.com/tensorflow/models.git -b $TF_OD_API_VERSION

cd models/research
protoc object_detection/protos/*.proto --python_out=.
cd ../..
cp -r models $LIBS_BASE/tensorflow
rm -rf models

echo 'export PYTHONPATH=$PYTHONPATH:$LIBS_BASE/tensorflow/models/research:$LIBS_BASE/tensorflow/models/research/slim' >> $SETUP_SCRIPT
