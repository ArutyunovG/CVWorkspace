#!/bin/bash

git clone --recursive https://github.com/pytorch/pytorch.git
cd pytorch && git checkout v1.2.0 && git submodule update --recursive --init
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

if [ "$ENABLE_TESTS" -eq "1" ]; then
    make -j$(nproc)
    make -j$(nproc) test
fi
make -j$(nproc) install
cd ../.. && mv pytorch/build/install $LIBS_BASE/caffe2 && rm -rf pytorch
caffe2_python_base_folder=$(ls $LIBS_BASE/caffe2/lib | grep python[0-9])
packages_folder=$(ls $LIBS_BASE/caffe2/lib/$caffe2_python_base_folder)
echo 'export PYTHONPATH=$PYTHONPATH:$LIBS_BASE/caffe2/lib/'$caffe2_python_base_folder'/'$packages_folder >> $SETUP_SCRIPT
echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$LIBS_BASE/caffe2/lib' >> $SETUP_SCRIPT
echo 'export CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:$LIBS_BASE/caffe2/share/cmake/Caffe2' >> $SETUP_SCRIPT
