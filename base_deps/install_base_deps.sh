#!/bin/bash

BASE_DEPS=$ROOT_DIR/base_deps

sudo apt update
sudo apt install -yq software-properties-common 
sudo apt install -yq wget git gfortran

source $BASE_DEPS/python_deps/install_python_deps.sh

source $BASE_DEPS/cocoapi/install_cocoapi.sh

source $BASE_DEPS/cmake/install_cmake.sh
source $BASE_DEPS/bazel/install_bazel.sh

source $SETUP_SCRIPT

source $BASE_DEPS/boost/install_boost.sh
source $BASE_DEPS/opencv/install_opencv.sh
source $BASE_DEPS/zlib/install_zlib.sh
source $BASE_DEPS/protobuf/install_protobuf.sh
source $BASE_DEPS/gflags/install_gflags.sh
source $BASE_DEPS/glog/install_glog.sh
source $BASE_DEPS/leveldb/install_leveldb.sh
source $BASE_DEPS/lmdb/install_lmdb.sh
source $BASE_DEPS/hdf5/install_hdf5.sh
source $BASE_DEPS/openblas/install_openblas.sh
source $BASE_DEPS/snappy/install_snappy.sh
source $BASE_DEPS/gtest/install_gtest.sh

source $SETUP_SCRIPT
