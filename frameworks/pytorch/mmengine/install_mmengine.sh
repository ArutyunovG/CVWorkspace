# !/bin/bash

git clone https://github.com/open-mmlab/mmengine.git

cd mmengine && git checkout $MMENGINE_CHECKOUT_TARGET

python setup.py install

cd .. && rm -rf mmengine
