#!/bin/bash

mkdir -p $LIBS_BASE

wget https://github.com/protocolbuffers/protobuf/releases/download/v3.9.1/protobuf-all-3.9.1.tar.gz
tar -zxvf protobuf-all-3.9.1.tar.gz && rm protobuf-all-3.9.1.tar.gz
cd protobuf-3.9.1/cmake && mkdir build && cd build
cmake .. -DCMAKE_INSTALL_PREFIX=install \
         -DBUILD_SHARED_LIBS=ON \
         -DZLIB_ROOT=$LIBS_BASE/zlib
make -j$(nproc) install
cd ../../.. && mv protobuf-3.9.1/cmake/build/install $LIBS_BASE/protobuf && rm -rf protobuf-3.9.1
ln -s $LIBS_BASE/protobuf/bin $UTILS_BASE/protobuf

echo 'export PATH=$PATH:$UTILS_BASE/protobuf' >> $SETUP_SCRIPT
