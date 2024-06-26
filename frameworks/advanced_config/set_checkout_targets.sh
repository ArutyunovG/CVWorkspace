#!/bin/bash

# Caffe

: ${CAFFE_CHECKOUT_TARGET:=$CAFFE_VERSION}
: ${CAFFE_SSD_CHECKOUT_TARGET:=$CAFFE_SSD_VERSION}

# Pytorch

: ${PYTORCH_CHECKOUT_TARGET:=v$PYTORCH_VERSION}
: ${FVCORE_CHECKOUT_TARGET:=$FVCORE_VERSION}
: ${DETECTRON2_CHECKOUT_TARGET:=v$DETECTRON2_VERSION}
: ${TORCHVISION_CHECKOUT_TARGET:=v$TORCHVISION_VERSION}
: ${MIM_CHECKOUT_TARGET:=v$MIM_VERSION}
: ${MMENGINE_CHECKOUT_TARGET:=v$MMENGINE_VERSION}
: ${MMCV_CHECKOUT_TARGET:=v$MMCV_VERSION}
: ${MMPRETRAIN_CHECKOUT_TARGET:=v$MMPRETRAIN_VERSION}
: ${MMDETECTION_CHECKOUT_TARGET:=v$MMDETECTION_VERSION}
: ${MMSEGMENTATION_CHECKOUT_TARGET:=v$MMSEGMENTATION_VERSION}
: ${MMDEPLOY_CHECKOUT_TARGET:=v$MMDEPLOY_VERSION}

# Tensorflow

: ${TENSORFLOW_CHECKOUT_TARGET:=v$TENSORFLOW_VERSION}
