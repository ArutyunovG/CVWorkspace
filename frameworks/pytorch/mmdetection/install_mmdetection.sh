#!/bin/bash

git clone https://github.com/open-mmlab/mmdetection.git

cd mmdetection && git checkout $MMDETECTION_CHECKOUT_TARGET

python setup.py install

cd .. && rm -rf mmdetection
