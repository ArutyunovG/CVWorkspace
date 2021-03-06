#!/bin/bash

git clone --recursive https://github.com/weidai11/cryptopp.git
cd cryptopp && git checkout CRYPTOPP_$(echo $CRYPTOPP_VERSION | sed 's/\./_/g') && cd ..
git clone https://github.com/noloader/cryptopp-cmake.git
cd cryptopp-cmake && git checkout CRYPTOPP_$(echo $CRYPTOPP_VERSION | sed 's/\./_/g') && git apply $ROOT_DIR/production/cryptopp/cryptopp_cmake.patch && cd ..
cp cryptopp-cmake/CMakeLists.txt cryptopp-cmake/cryptopp-config.cmake cryptopp
rm -rf cryptopp-cmake
cd cryptopp && mkdir build && cd build
cmake .. -DCMAKE_INSTALL_PREFIX=install
make -j$(nproc) install
cd ../.. && mv cryptopp/build/install $LIBS_BASE/cryptopp && rm -rf cryptopp
echo 'export CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:$LIBS_BASE/cryptopp/lib/cmake/cryptopp' >> $SETUP_SCRIPT
