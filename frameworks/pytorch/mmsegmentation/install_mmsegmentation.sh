#!/bin/bash

git clone https://github.com/open-mmlab/mmsegmentation.git

cd mmsegmentation && git checkout $MMSEGMENTATION_CHECKOUT_TARGET

python setup.py install

cd .. && rm -rf mmsegmentation
