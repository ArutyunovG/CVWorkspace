#!/bin/bash

# 
# It is recommended to use official OpenVINO installer.
# One cannot reproduce it from source, because of lack
# of specific tools
#
#
# This script is mainly for andanced developers, 
# who prefer to go deeper into 
# understanding of OpenVINO source code 
#

#
# OpenVINO searches for some deps with absolute build paths
# We have to build it where it is going to be used
#
cd $LIBS_BASE

git clone --recursive https://github.com/opencv/dldt.git
cd dldt && git checkout $OPENVINO_VERSION && git submodule update --recursive --init
mkdir build && cd build

#
# ENABLE_MKL_DNN -- for Intel CPUs
# ENABLE_CLDNN -- for integrated Intel HD Graphics
# ENABLE_VPU -- for Movidius Myriad X (requires libusb)
#
cmake .. \
    -DENABLE_MKL_DNN=ON \
    -DENABLE_CLDNN=ON \
    -DENABLE_VPU=OFF \
    -DNGRAPH_USE_SYSTEM_PROTOBUF=ON \
    -DProtobuf_INCLUDE_DIR=$LIBS_BASE/protobuf/include \
    -DProtobuf_LIBRARY=$LIBS_BASE/protobuf/lib/libprotobuf.so \
    -DCMAKE_CXX_FLAGS="-Wno-deprecated-declarations"

make -j$(nproc)

echo 'export CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:$LIBS_BASE/dldt/inference-engine/build' >> $SETUP_SCRIPT
echo 'export PATH=$PATH:$LIBS_BASE/dldt/model-optimizer' >> $SETUP_SCRIPT

# Return back
cd $ROOT_DIR
