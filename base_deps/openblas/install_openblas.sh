#!/bin/bash

mkdir -p $LIBS_BASE

apt install -yq gfortran
git clone --recursive https://github.com/xianyi/OpenBLAS.git
cd OpenBLAS && git checkout v0.3.6 && mkdir build && cd build
cmake .. -DCMAKE_INSTALL_PREFIX=install \
         -DBUILD_SHARED_LIBS=ON
make -j$(nproc) install
cd install && \
mkdir tmp_include && mv include/openblas/* tmp_include && \
rm -r include && mv tmp_include include && cd ..
cd ../.. && mv OpenBLAS/build/install $LIBS_BASE/openblas && rm -rf OpenBLAS

echo 'export OpenBLAS_HOME=$LIBS_BASE/openblas' >> $SETUP_SCRIPT
echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$LIBS_BASE/openblas/lib' >> $SETUP_SCRIPT
