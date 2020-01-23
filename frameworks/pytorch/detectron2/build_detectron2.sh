#!/bin/bash

git clone --recursive http://github.com/facebookresearch/detectron2.git -b $DETECTRON2_VERSION
cd detectron2
python -m pip install --editable .

cd .. && mkdir -p $LIBS_BASE/pytorch && mv detectron2 $LIBS_BASE/pytorch/detectron2

echo 'export PYTHONPATH=$PYTHONPATH:$LIBS_BASE/pytorch/detectron2' >> $SETUP_SCRIPT
