#!/bin/bash

# Caffe

: ${CAFFE_PATCH:=}
: ${CAFFE_SSD_PATCH:=}

# Caffe2

: ${CAFFE2_PATCH:=}
: ${DETECTRON_PATCH:=}

# MXNet

: ${MXNET_PATCH:=}
: ${GLUONCV_PATCH:=}

# Pytorch

: ${PYTORCH_PATCH:=}
: ${APEX_PATCH:=}
: ${FVCORE_PATCH:=}
: ${DETECTRON2_PATCH:=}
: ${TORCHVISION_PATCH:=}

# Tensorflow

: ${TENSORFLOW_PATCH:=$ROOT_DIR/frameworks/tensorflow/main/tf_cuda10_2.patch}
: ${TF_OD_API_PATCH:=}
