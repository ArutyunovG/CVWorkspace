#!/bin/bash

# Caffe

: ${CAFFE_PATCH:=$ROOT_DIR/frameworks/caffe/main/caffe.patch}
: ${CAFFE_SSD_PATCH:=$ROOT_DIR/frameworks/caffe/ssd/caffe.patch}

# MXNet

: ${MXNET_PATCH:=}
: ${GLUONCV_PATCH:=}

# Pytorch

: ${PYTORCH_PATCH:=}
: ${APEX_PATCH:=}
: ${FVCORE_PATCH:=}
: ${DETECTRON2_PATCH:=}
: ${TORCHVISION_PATCH:=}
: ${CLASSYVISION_PATCH:=}

# Tensorflow

: ${TENSORFLOW_PATCH:=}
: ${TF_OD_API_PATCH:=}


#=======================

# the following allows to use relative paths for set patches
# it is a utility code not interesting for the end user

if [ -n "$CAFFE_PATCH" ]; then
    CAFFE_PATCH=$(realpath $CAFFE_PATCH)
fi

if [ -n "$CAFFE_SSD_PATCH" ]; then
    CAFFE_SSD_PATCH=$(realpath $CAFFE_SSD_PATCH)
fi

if [ -n "$CAFFE2_PATCH" ]; then
    CAFFE2_PATCH=$(realpath $CAFFE2_PATCH)
fi

if [ -n "$DETECTRON_PATCH" ]; then
    DETECTRON_PATCH=$(realpath $DETECTRON_PATCH)
fi

if [ -n "$MXNET_PATCH" ]; then
    MXNET_PATCH=$(realpath $MXNET_PATCH)
fi

if [ -n "$GLUONCV_PATCH" ]; then
    GLUONCV_PATCH=$(realpath $GLUONCV_PATCH)
fi

if [ -n "$PYTORCH_PATCH" ]; then
    PYTORCH_PATCH=$(realpath $PYTORCH_PATCH)
fi

if [ -n "$APEX_PATCH" ]; then
    APEX_PATCH=$(realpath $APEX_PATCH)
fi

if [ -n "$FVCORE_PATCH" ]; then
    FVCORE_PATCH=$(realpath $FVCORE_PATCH)
fi

if [ -n "$DETECTRON2_PATCH" ]; then
    DETECTRON2_PATCH=$(realpath $DETECTRON2_PATCH)
fi

if [ -n "$CLASSYVISION_PATCH" ]; then
    CLASSYVISION_PATCH=$(realpath $CLASSYVISION_PATCH)
fi

if [ -n "$TENSORFLOW_PATCH" ]; then
    TENSORFLOW_PATCH=$(realpath $TENSORFLOW_PATCH)
fi

if [ -n "$TF_OD_API_PATCH" ]; then
    TF_OD_API_PATCH=$(realpath $TF_OD_API_PATCH)
fi
