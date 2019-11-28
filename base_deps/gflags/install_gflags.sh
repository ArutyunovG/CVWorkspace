#!/bin/bash

mkdir -p $LIBS_BASE

git clone --recursive https://github.com/gflags/gflags.git
cd gflags && git checkout v2.2.2
mkdir build && cd build
cmake .. -DCMAKE_INSTALL_PREFIX=install \
         -DBUILD_SHARED_LIBS=ON
make -j$(nproc) install
cd ../.. && mv gflags/build/install $LIBS_BASE/gflags && rm -rf gflags

echo 'export CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:$LIBS_BASE/gflags/lib/cmake/gflags' >> $SETUP_SCRIPT
