#!/bin/bash

git clone --recursive $DETECTRON_URL -b DETECTRON_VERSION
python -m pip install -r Detectron/requirements.txt
cd Detectron && make -j$(nproc)
echo 'export PYTHONPATH=$PYTHONPATH:$LIBS_BASE/caffe2/detectron' >> $SETUP_SCRIPT
detectron_lib=$(find $LIBS_BASE | grep libcaffe2_detectron_ops)
mkdir -p $LIBS_BASE/caffe2/detectron/lib && cp $detectron_lib $LIBS_BASE/caffe2/detectron/lib
cp -r . $LIBS_BASE/caffe2/detectron
cd .. && rm -rf Detectron

