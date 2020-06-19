#!/bin/bash

git clone --recursive $MXNET_URL
cd incubator-mxnet && git checkout $MXNET_CHECKOUT_TARGET && git submodule update --recursive --init

if [ -n "$MXNET_PATCH" ]; then
    git apply $MXNET_PATCH
fi

mkdir -p build && cd build
cmake .. -DCMAKE_INSTALL_PREFIX=install \
         -DCMAKE_CUDA_COMPILER=/usr/local/cuda/bin/nvcc \
         -DUSE_LAPACK=OFF \
         -DCUDA_ARCH_LIST="$MXNET_CUDA_ARCH" 

if [ "$ENABLE_TESTS" = "1" ]; then
    make -j$(nproc)
    ./tests/mxnet_unit_tests
fi
make -j$(nproc) install
cd ../.. && mv incubator-mxnet/build/install $LIBS_BASE/mxnet
cp -r incubator-mxnet/python $LIBS_BASE/mxnet/python
libmklml=$(find . | grep libmklml_intel.so)
cp $libmklml $LIBS_BASE/mxnet/lib
echo 'export PYTHONPATH=$PYTHONPATH:$LIBS_BASE/mxnet/python' >> $SETUP_SCRIPT
echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$LIBS_BASE/mxnet/lib' >> $SETUP_SCRIPT
rm -rf incubator-mxnet
