#!/bin/bash

mkdir -p $LIBS_BASE

git clone --recursive https://github.com/madler/zlib.git
cd zlib && git checkout v$ZLIB_VERSION
mkdir build && cd build && cmake .. -DCMAKE_INSTALL_PREFIX=install
make -j$(nproc) install
cd ../.. && mv zlib/build/install $LIBS_BASE/zlib && rm -rf zlib

echo 'export ZLIB_ROOT=$LIBS_BASE/zlib' >> $SETUP_SCRIPT
