#!/bin/bash

git clone --recursive $DETECTRON_URL
cd Detectron && git checkout $DETECTRON_CHECKOUT_TARGET

if [ -n "$DETECTRON_PATCH" ]; then
    git apply $DETECTRON_PATCH
fi

python -m pip install -r requirements.txt
make -j$(nproc)
echo 'export PYTHONPATH=$PYTHONPATH:$LIBS_BASE/caffe2/detectron' >> $SETUP_SCRIPT
detectron_lib=$(find $LIBS_BASE | grep libcaffe2_detectron_ops)
mkdir -p $LIBS_BASE/caffe2/detectron/lib && cp $detectron_lib $LIBS_BASE/caffe2/detectron/lib
cp -r . $LIBS_BASE/caffe2/detectron
cd .. && rm -rf Detectron
