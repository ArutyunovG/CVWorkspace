# !/bin/bash

git clone https://github.com/open-mmlab/mmcv.git

cd mmcv && git checkout $MMCV_CHECKOUT_TARGET

if [ $MMCV_BUILD_TYPE = "Debug" ]; then
    CFLAGS='-O0 -g' python setup.py install
fi

if [ $MMCV_BUILD_TYPE = "RelWithDebInfo" ]; then
    CFLAGS='-g' python setup.py install
fi

if [ $MMCV_BUILD_TYPE = "Release" ]; then
    CFLAGS='' python setup.py install
fi

cd .. && rm -rf mmcv
