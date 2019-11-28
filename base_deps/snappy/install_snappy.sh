#!/bin/bash

mkdir -p $LIBS_BASE

git clone --recursive https://github.com/google/snappy.git
cd snappy && git checkout 1.1.7 && mkdir build && cd build
cmake .. -DCMAKE_INSTALL_PREFIX=install \
         -DBUILD_SHARED_LIBS=ON
make -j$(nproc) install
cd ../.. && mv snappy/build/install $LIBS_BASE/snappy && rm -rf snappy
