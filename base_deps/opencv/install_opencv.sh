#!/bin/bash

mkdir -p $LIBS_BASE

git clone --recursive https://github.com/opencv/opencv.git
cd opencv

git checkout 4.1.1
mkdir build && cd build
cmake .. -DCMAKE_INSTALL_PREFIX=install -DWITH_OPENCL=OFF -DWITH_CUDA=OFF
make -j$(nproc) install
cd ../.. && mv opencv/build/install $LIBS_BASE/opencv4 && rm -rf opencv

git clone --recursive https://github.com/opencv/opencv.git
cd opencv

git checkout 3.4.7
mkdir build && cd build
cmake .. -DCMAKE_INSTALL_PREFIX=install -DWITH_OPENCL=OFF -DWITH_CUDA=OFF
make -j$(nproc) install
cd ../.. && mv opencv/build/install $LIBS_BASE/opencv3 && rm -rf opencv

echo 'export CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:$LIBS_BASE/opencv4/lib/cmake/opencv4' >> $SETUP_SCRIPT
echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$LIBS_BASE/opencv4/lib' >> $SETUP_SCRIPT
