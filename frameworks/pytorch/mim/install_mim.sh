#! /bin/bash

git clone https://github.com/open-mmlab/mim.git

cd mim && git checkout $MIM_CHECKOUT_TARGET

python setup.py install

cd .. && rm -rf mim
