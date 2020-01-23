#!/bin/bash

mkdir -p $LIBS_BASE

git clone --recursive https://github.com/xianyi/OpenBLAS.git
cd OpenBLAS && git checkout v$OPENBLAS_VERSION
make -j$(nproc)
make -j$(nproc) install DESTDIR=install
cd .. && mv OpenBLAS/install/opt/OpenBLAS $LIBS_BASE/openblas && rm -rf OpenBLAS

echo 'export OpenBLAS_HOME=$LIBS_BASE/openblas' >> $SETUP_SCRIPT
echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$LIBS_BASE/openblas/lib' >> $SETUP_SCRIPT
