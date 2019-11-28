#!/bin/bash

mkdir -p $LIBS_BASE

git clone --recursive https://github.com/LMDB/lmdb.git
cd lmdb && git checkout LMDB_0.9.24
cd libraries/liblmdb && make -j$(nproc) install DESTDIR=install
cd ../../.. && mv lmdb/libraries/liblmdb/install/usr/local $LIBS_BASE/lmdb && rm -rf lmdb

echo 'export LMDB_DIR=$LIBS_BASE/lmdb' >> $SETUP_SCRIPT
