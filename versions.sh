#!/bin/bash

# ===== BASE_DEPS =====

: ${BAZEL_VERSION:=0.26.1}
: ${BOOST_VERSION:=1.69.0}
: ${CMAKE_VERSION:=3.16.3}

# no versions supported for cocoapi
: ${COCOAPI_VERSION:=master}

: ${GFLAGS_VERSION:=2.2.2}
: ${GLOG_VERSION:=0.3.5}
: ${GTEST_VERSION:=1.10.0}
: ${HDF5_VERSION:=1.10.5}
: ${LEVELDB_VERSION:=1.20}
: ${LMDB_VERSION:=0.9.24}
: ${OPENBLAS_VERSION:=0.3.6}
# Caffe does not support OpenCV4
: ${OPENCV3_VERSION:=3.4.7}
: ${OPENCV4_VERSION:=4.1.1}
: ${PROTOBUF_VERSION:=3.9.1}
: ${PYTHON_VERSION:=3.7}
: ${SNAPPY_VERSION:=1.1.7}
: ${ZLIB_VERSION:=1.2.11}

# ===== FRAMEWORKS =====

# Caffe

# install main caffe from master branch
: ${CAFFE_VERSION:=master}

# install ssd caffe fork from ssd branch
: ${CAFFE_SSD_URL:=https://github.com/weiliu89/caffe.git}
: ${CAFFE_SSD_VERSION:=ssd}

# Caffe2

# actually this is Pytorch release, since Caffe2 is in the Pytorch repo
: ${CAFFE2_VERSION:=1.2.0}

# unlike detectron2, people often change original detectron, so provide url
: ${DETECTRON_URL:=https://github.com/facebookresearch/Detectron.git}

# install detectron from master branch
: ${DETECTRON_VERSION:=master}

# MXNet

: ${MXNET_VERSION:=1.5.0}
: ${GLUONCV_VERSION:=0.4.0}

# Pytorch

: ${PYTORCH_VERSION:=1.4.0}

# apex github branch
: ${APEX_VERSION:=master}

# detectron2 github branch
: ${DETECTRON2_VERSION:=master}

: ${TORCHVISION_VERSION:=0.5.0}

# Tensorflow

: ${TENSORFLOW_VERSION:=1.14}

# TF OD API does support actual versioning
# But it is not updated that much nowadays
: ${TF_OD_API_VERSION:=master}

# ====== ADDITIONAL and PRODUCTION ======

: ${FFMPEG_VERSION:=4.2}

: ${CRYPTOPP_VERSION:=8.2.0}

: ${QT_VERSION:=5.12.0}

# The only branch of Dataset-Converters
: ${DATASET_CONVERTERS_VERSION:=master}

# OpenVINO branch, if you decide to build from source
: ${OPENVINO_VERSION:=2019}
