#!/bin/bash

BASE_DEPS=$ROOT_DIR/base_deps

source $BASE_DEPS/config.sh

if [ "$WITH_BASE_DEPS" = "1" ]; then
    sudo apt update
    sudo apt install -yq software-properties-common 
    sudo apt install -yq wget git gfortran
    sudo apt install -yq patchelf
fi

if [ "$WITH_PYTHON_DEPS" = "1" ]; then
    source $BASE_DEPS/python_deps/install_python_deps.sh
fi

if [ "$WITH_COCO_API" = "1" ]; then
    source $BASE_DEPS/cocoapi/install_cocoapi.sh
fi

if [ "$WITH_CMAKE" = "1" ]; then
    source $BASE_DEPS/cmake/install_cmake.sh
fi
if [ "$WITH_BAZEL" = "1" ]; then
    source $BASE_DEPS/bazel/install_bazel.sh
fi

source $SETUP_SCRIPT

if [ "$WITH_BOOST" = "1" ]; then
    source $BASE_DEPS/boost/install_boost.sh
fi
if [ "$WITH_OPENCV" = "1" ] || [ "$WITH_OPENCV3" = "1" ] || [ "$WITH_OPENCV4" = "1" ]; then
    source $BASE_DEPS/opencv/install_opencv.sh
fi
if [ "$WITH_ZLIB" = "1" ]; then
    source $BASE_DEPS/zlib/install_zlib.sh
fi
if [ "$WITH_PROTOBUF" = "1" ]; then
    source $BASE_DEPS/protobuf/install_protobuf.sh
fi
if [ "$WITH_GFLAGS" = "1" ]; then
    source $BASE_DEPS/gflags/install_gflags.sh
fi
if [ "$WITH_GLOG" = "1" ]; then
    source $BASE_DEPS/glog/install_glog.sh
fi
if [ "$WITH_LEVELDB" = "1" ]; then
    source $BASE_DEPS/leveldb/install_leveldb.sh
fi
if [ "$WITH_LMDB" = "1" ]; then
    source $BASE_DEPS/lmdb/install_lmdb.sh
fi
if [ "$WITH_HDF5" = "1" ]; then
    source $BASE_DEPS/hdf5/install_hdf5.sh
fi
if [ "$WITH_OPENBLAS" = "1" ]; then
    source $BASE_DEPS/openblas/install_openblas.sh
fi
if [ "$WITH_SNAPPY" = "1" ]; then
    source $BASE_DEPS/snappy/install_snappy.sh
fi
if [ "$WITH_GTEST" = "1" ]; then
    source $BASE_DEPS/gtest/install_gtest.sh
fi

source $SETUP_SCRIPT
