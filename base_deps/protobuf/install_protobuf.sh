#!/bin/bash

mkdir -p $LIBS_BASE

git clone https://github.com/protocolbuffers/protobuf.git
cd protobuf && git checkout v$PROTOBUF_VERSION
git submodule update --recursive --init
mkdir build && cd build
cmake .. -DCMAKE_INSTALL_PREFIX=install \
         -DBUILD_SHARED_LIBS=ON \
         -DZLIB_ROOT=$LIBS_BASE/zlib
make -j$(nproc) install
cd ../.. && mv protobuf/build/install $LIBS_BASE/protobuf && rm -rf protobuf
ln -s $LIBS_BASE/protobuf/bin $UTILS_BASE/protobuf

echo 'export LD_LIBRARY_PATH=$LIBS_BASE/protobuf/lib' >> $SETUP_SCRIPT
echo 'export PATH=$PATH:$UTILS_BASE/protobuf' >> $SETUP_SCRIPT
