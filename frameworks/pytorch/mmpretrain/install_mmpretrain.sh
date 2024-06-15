#!/bin/bash

git clone https://github.com/open-mmlab/mmpretrain.git

cd mmpretrain && git checkout $MMPRETRAIN_CHECKOUT_TARGET

python setup.py install

cd .. && rm -rf mmpretrain

