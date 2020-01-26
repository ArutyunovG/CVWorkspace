#!/bin/bash

mkdir -p $LIBS_BASE

wget https://github.com/protocolbuffers/protobuf/releases/download/v$PROTOBUF_VERSION/protobuf-all-$PROTOBUF_VERSION.tar.gz
tar -zxvf protobuf-all-$PROTOBUF_VERSION.tar.gz && rm protobuf-all-$PROTOBUF_VERSION.tar.gz
cd protobuf-$PROTOBUF_VERSION/cmake && mkdir build && cd build
cmake .. -DCMAKE_INSTALL_PREFIX=install \
         -DBUILD_SHARED_LIBS=ON \
         -DZLIB_ROOT=$LIBS_BASE/zlib
make -j$(nproc) install
cd ../../.. && mv protobuf-$PROTOBUF_VERSION/cmake/build/install $LIBS_BASE/protobuf && rm -rf protobuf-$PROTOBUF_VERSION
ln -s $LIBS_BASE/protobuf/bin $UTILS_BASE/protobuf

echo 'export PATH=$PATH:$UTILS_BASE/protobuf' >> $SETUP_SCRIPT
