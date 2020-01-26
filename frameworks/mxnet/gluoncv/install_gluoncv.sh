#!/bin/bash

git clone --recursive https://github.com/dmlc/gluon-cv.git
cd gluon-cv && git checkout v$GLUONCV_VERSION
cp -r . $LIBS_BASE/mxnet/gluoncv
echo 'export PYTHONPATH=$PYTHONPATH:$LIBS_BASE/mxnet/gluoncv' >> $SETUP_SCRIPT
cd .. && rm -rf gluon-cv
