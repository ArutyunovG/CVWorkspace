#!/bin/bash

git clone --recursive https://github.com/dmlc/gluon-cv.git
cd gluon-cv && git checkout v0.4.0
cp -r . $LIBS_BASE/mxnet/gluoncv
echo 'export PYTHONPATH=$PYTHONPATH:$LIBS_BASE/mxnet/gluoncv' >> $SETUP_SCRIPT
cd .. && rm -rf gluon-cv
