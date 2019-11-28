#!/bin/bash

mkdir -p $LIBS_BASE

git clone --recursive https://github.com/google/glog.git
cd glog && git checkout v0.3.5
mkdir build && cd build
cmake .. -DCMAKE_INSTALL_PREFIX=install \
	 -DBUILD_SHARED_LIBS=ON \
	 -Dgflags_DIR=$LIBS_BASE/gflags/lib/cmake/gflags && \
make -j$(nproc) install
cd ../.. && mv glog/build/install $LIBS_BASE/glog && rm -rf glog

echo 'export CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:$LIBS_BASE/glog/lib/cmake/glog' >> $SETUP_SCRIPT
