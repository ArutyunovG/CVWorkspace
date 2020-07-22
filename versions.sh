#!/bin/bash

# ===== BASE_DEPS =====

: ${BAZEL_VERSION:=0.26.1}
: ${BOOST_VERSION:=1.73.0}
: ${CMAKE_VERSION:=3.17.2}

# no versions supported for cocoapi
: ${COCOAPI_VERSION:=master}

: ${GFLAGS_VERSION:=2.2.2}
: ${GLOG_VERSION:=0.4.0}
: ${GTEST_VERSION:=1.10.0}
: ${HDF5_VERSION:=1.12.0}
: ${LEVELDB_VERSION:=1.20}
: ${LMDB_VERSION:=0.9.24}
: ${OPENBLAS_VERSION:=0.3.9}
# Caffe does not support OpenCV4
: ${OPENCV3_VERSION:=3.4.10}
: ${OPENCV4_VERSION:=4.3.0}
: ${PROTOBUF_VERSION:=3.11.3}
: ${PYTHON_VERSION:=3.7}
: ${SNAPPY_VERSION:=1.1.8}
: ${ZLIB_VERSION:=1.2.11}

# ===== FRAMEWORKS =====

# Caffe

# install main caffe from master branch
: ${CAFFE_VERSION:=master}

# install ssd caffe fork from ssd branch
: ${CAFFE_SSD_VERSION:=ssd}

# Caffe2

# actually this is Pytorch release, since Caffe2 is in the Pytorch repo
: ${CAFFE2_VERSION:=1.5.0}

# install detectron from master branch
: ${DETECTRON_VERSION:=master}

# MXNet

: ${MXNET_VERSION:=1.6.0}
: ${GLUONCV_VERSION:=0.7.0}

# Pytorch

: ${PYTORCH_VERSION:=1.5.0}

# apex github branch
: ${APEX_VERSION:=master}

: ${FVCORE_VERSION:=master}

: ${DETECTRON2_VERSION:=0.2}

: ${TORCHVISION_VERSION:=0.6.0}

: ${CLASSYVISION_VERSION:=0.4.0}

# Tensorflow

: ${TENSORFLOW_VERSION:=1.15}

# TF OD API does support actual versioning
# But it is not updated that much nowadays
: ${TF_OD_API_VERSION:=master}

# ====== ADDITIONAL and PRODUCTION ======

: ${FFMPEG_VERSION:=4.2}

: ${CRYPTOPP_VERSION:=8.2.0}

# The only branch of Dataset-Converters
: ${DATASET_CONVERTERS_VERSION:=master}

# OpenVINO version, if you decide to build from source
: ${OPENVINO_VERSION:=2020.2}
