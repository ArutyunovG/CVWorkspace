#!/bin/bash

git clone --recursive $CAFFE2_URL
cd pytorch && git checkout $CAFFE2_CHECKOUT_TARGET && git submodule update --recursive --init

if [ -n "$CAFFE2_PATCH" ]; then
    git apply $CAFFE2_PATCH
fi

mkdir build && cd build
cmake .. -DCMAKE_INSTALL_PREFIX=install \
         -DUSE_FBGEMM=OFF \
         -DUSE_QNNPACK=OFF \
         -DUSE_NNPACK=OFF \
         -DUSE_OPENCV=ON \
         -DUSE_LEVELDB=ON \
         -DUSE_LMDB=ON \
         -DUSE_GFLAGS=ON \
         -DUSE_GLOG=ON \
         -DUSE_GLOO=OFF \
         -DSNAPPY_ROOT_DIR=$LIBS_BASE/snappy \
         -DTORCH_CUDA_ARCH_LIST="$TORCH_CUDA_ARCH" \
         -DBLAS=OpenBLAS \
         -DBUILD_TEST=ON \
         -DUSE_ROCM=OFF

if [ "$ENABLE_TESTS" = "1" ]; then
    make -j$(nproc)
    make -j$(nproc) test
fi
make -j$(nproc) install
cd ../.. && mv pytorch/build/install $LIBS_BASE/caffe2 && rm -rf pytorch

echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$LIBS_BASE/caffe2/lib' >> $SETUP_SCRIPT
echo 'export CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:$LIBS_BASE/caffe2/share/cmake/Caffe2' >> $SETUP_SCRIPT
