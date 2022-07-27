#!/bin/bash

# ===== BASE_DEPS =====

: ${BAZEL_VERSION:=5.0.0}
: ${BOOST_VERSION:=1.79.0}
: ${CMAKE_VERSION:=3.23.2}

# no versions supported for cocoapi
: ${COCOAPI_VERSION:=master}

: ${GFLAGS_VERSION:=2.2.2}
: ${GLOG_VERSION:=0.6.0}
: ${GTEST_VERSION:=1.11.0}
: ${HDF5_VERSION:=1.12.0}
: ${LEVELDB_VERSION:=1.20}
: ${LMDB_VERSION:=0.9.28}
: ${OPENBLAS_VERSION:=0.3.20}
# Caffe does not support OpenCV4
: ${OPENCV3_VERSION:=3.4.17}
: ${OPENCV4_VERSION:=4.5.5}
: ${PROTOBUF_VERSION:=3.21.1}
: ${PYTHON_VERSION:=3.7}
: ${SNAPPY_VERSION:=1.1.8}
: ${ZLIB_VERSION:=1.2.12}

# ===== FRAMEWORKS =====

# Caffe

# install main caffe from master branch
: ${CAFFE_VERSION:=master}

# install ssd caffe fork from ssd branch
: ${CAFFE_SSD_VERSION:=ssd}

# MXNet

: ${MXNET_VERSION:=1.9.1}
: ${GLUONCV_VERSION:=0.10.0}

# Pytorch

: ${PYTORCH_VERSION:=1.12.0}

: ${FVCORE_VERSION:=master}

: ${DETECTRON2_VERSION:=0.6}

: ${TORCHVISION_VERSION:=0.13.0}

: ${CLASSYVISION_VERSION:=0.6.0}

# Tensorflow

: ${TENSORFLOW_VERSION:=2.9}


# ====== ADDITIONAL and PRODUCTION ======

: ${FFMPEG_VERSION:=4.2}

: ${CRYPTOPP_VERSION:=8.2.0}

# The only branch of Dataset-Converters
: ${DATASET_CONVERTERS_VERSION:=master}

# OpenVINO version, if you decide to build from source
: ${OPENVINO_VERSION:=2020.4}
