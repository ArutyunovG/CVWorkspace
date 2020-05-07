#!/bin/bash

ROOT_DIR="$(dirname "$(readlink -f "$0")")"

source $ROOT_DIR/config.sh
source $ROOT_DIR/versions.sh
source $ROOT_DIR/util.sh
source $ROOT_DIR/create_setup_script.sh

if [ "$BUILD_BASE_DEPS" -eq "1" ]; then
    source $ROOT_DIR/base_deps/install_base_deps.sh
fi

if [ "$BUILD_CAFFE" -eq "1" ]; then
    source $ROOT_DIR/frameworks/caffe/main/install_caffe.sh
fi

if [ "$BUILD_CAFFE_SSD" -eq "1" ]; then
    source $ROOT_DIR/frameworks/caffe/ssd/install_caffe.sh
fi

if [ "$BUILD_CAFFE2" -eq "1" ]; then
    source $ROOT_DIR/frameworks/caffe2/main/install_caffe2.sh
fi

if [ "$BUILD_DETECTRON" -eq "1" ]; then
    source $ROOT_DIR/frameworks/caffe2/detectron/install_detectron.sh
fi

if [ "$BUILD_MXNET" -eq "1" ]; then
    source $ROOT_DIR/frameworks/mxnet/main/install_mxnet.sh
fi

if [ "$BUILD_GLUON" -eq "1" ]; then
    source $ROOT_DIR/frameworks/mxnet/gluoncv/install_gluoncv.sh
fi

if [ "$BUILD_PYTORCH" -eq "1" ]; then
    source $ROOT_DIR/frameworks/pytorch/main/install_pytorch.sh
fi

if [ "$BUILD_TORCHVISION" -eq "1" ]; then
    source $ROOT_DIR/frameworks/pytorch/torchvision/install_torchvision.sh
fi

if [ "$BUILD_APEX" -eq "1" ]; then
    source $ROOT_DIR/frameworks/pytorch/apex/install_apex.sh
fi

if [ "$INSTALL_FVCORE" -eq "1" ]; then
    source $ROOT_DIR/frameworks/pytorch/fvcore/install_fvcore.sh
fi

if [ "$BUILD_DETECTRON2" -eq "1" ]; then
    source $ROOT_DIR/frameworks/pytorch/detectron2/build_detectron2.sh
fi

if [ "$BUILD_TENSORFLOW" -eq "1" ]; then
    source $ROOT_DIR/frameworks/tensorflow/main/install_tensorflow.sh
fi

if [ "$BUILD_TF_OD_API" -eq "1" ]; then
    source $ROOT_DIR/frameworks/tensorflow/tf_od_api/install_tf_od_api.sh
fi

if [ "$BUILD_OPENVINO" -eq "1" ]; then
    source $ROOT_DIR/additional/openvino/install_openvino.sh	
fi

if [ "$INSTALL_DATASET_CONVERTERS" -eq "1" ]; then
    source $ROOT_DIR/additional/dataset_converters/install_dataset_converters.sh
fi

if [ "$BUILD_FFMPEG" -eq "1" ]; then
    source $ROOT_DIR/additional/ffmpeg/install_ffmpeg.sh
fi

if [ "$BUILD_CRYPTOPP" -eq "1" ]; then
    source $ROOT_DIR/production/cryptopp/install_cryptopp.sh
fi
