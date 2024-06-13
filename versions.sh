#!/bin/bash

# ===== BASE_DEPS =====

: ${BAZEL_VERSION:=6.5.0}
: ${BOOST_VERSION:=1.85.0}
: ${CMAKE_VERSION:=3.29.5}

# no versions supported for cocoapi
: ${COCOAPI_VERSION:=master}

: ${GFLAGS_VERSION:=2.2.2}
: ${GLOG_VERSION:=0.7.1}
: ${GTEST_VERSION:=1.14.0}
: ${HDF5_VERSION:=1.12.0}
: ${LEVELDB_VERSION:=1.20}
: ${LMDB_VERSION:=0.9.31}
: ${OPENBLAS_VERSION:=0.3.27}
# Caffe does not support OpenCV4
: ${OPENCV3_VERSION:=3.4.20}
: ${OPENCV4_VERSION:=4.10.0}
: ${PROTOBUF_VERSION:=25.3}
: ${PYTHON_VERSION:=3.12}
: ${SNAPPY_VERSION:=1.2.1}
: ${ZLIB_VERSION:=1.3.1}

# ===== FRAMEWORKS =====

# Caffe

# install main caffe from master branch
: ${CAFFE_VERSION:=master}

# install ssd caffe fork from ssd branch
: ${CAFFE_SSD_VERSION:=ssd}

# Pytorch

: ${PYTORCH_VERSION:=2.3.1}

: ${FVCORE_VERSION:=master}

: ${DETECTRON2_VERSION:=0.6}

: ${TORCHVISION_VERSION:=0.18.1}

: ${CLASSYVISION_VERSION:=0.6.0}

# Tensorflow

: ${TENSORFLOW_VERSION:=2.16.1}


# ====== ADDITIONAL and PRODUCTION ======

: ${FFMPEG_VERSION:=4.2}

: ${CRYPTOPP_VERSION:=8.2.0}

# The only branch of Dataset-Converters
: ${DATASET_CONVERTERS_VERSION:=master}

# OpenVINO version, if you decide to build from source
: ${OPENVINO_VERSION:=2020.4}
