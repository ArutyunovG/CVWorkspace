#!/bin/bash

mkdir -p $LIBS_BASE

git clone --recursive https://github.com/google/leveldb.git
cd leveldb && git checkout v$LEVELDB_VERSION
make -j$(nproc)
cd .. && mkdir $LIBS_BASE/leveldb && mkdir $LIBS_BASE/leveldb/lib
cp leveldb/out-static/lib* leveldb/out-shared/lib* $LIBS_BASE/leveldb/lib
cp -r leveldb/include $LIBS_BASE/leveldb/include
rm -rf leveldb

echo 'export LEVELDB_ROOT=$LIBS_BASE/leveldb' >> $SETUP_SCRIPT
