#!/bin/bash

ROOT_DIR="$(dirname "$(readlink -f "$0")")"

source $ROOT_DIR/utils/checkout_cvworkspace.sh

source $ROOT_DIR/config.sh
source $ROOT_DIR/versions.sh
source $ROOT_DIR/utils/prepare_compute_caps.sh
source $ROOT_DIR/utils/create_setup_script.sh
source $ROOT_DIR/frameworks/advanced_config/set_build_types.sh
source $ROOT_DIR/frameworks/advanced_config/set_checkout_targets.sh
source $ROOT_DIR/frameworks/advanced_config/set_urls.sh
source $ROOT_DIR/frameworks/advanced_config/set_patches.sh

# by default we set individual WITH_{Target} to WITH_BASE_DEPS
source $ROOT_DIR/base_deps/install_base_deps.sh

if [ "$WITH_CAFFE" = "1" ]; then
    source $ROOT_DIR/frameworks/caffe/main/install_caffe.sh
fi

if [ "$WITH_CAFFE_SSD" = "1" ]; then
    source $ROOT_DIR/frameworks/caffe/ssd/install_caffe.sh
fi

if [ "$WITH_PYTORCH" = "1" ]; then
    source $ROOT_DIR/frameworks/pytorch/main/install_pytorch.sh
fi

if [ "$WITH_TORCHVISION" = "1" ]; then
    source $ROOT_DIR/frameworks/pytorch/torchvision/install_torchvision.sh
fi

if [ "$WITH_FVCORE" = "1" ]; then
    source $ROOT_DIR/frameworks/pytorch/fvcore/install_fvcore.sh
fi

if [ "$WITH_DETECTRON2" = "1" ]; then
    source $ROOT_DIR/frameworks/pytorch/detectron2/build_detectron2.sh
fi

if [ "$WITH_MIM" = "1" ]; then
    source $ROOT_DIR/frameworks/pytorch/mim/install_mim.sh
fi

if [ "$WITH_MMENGINE" = "1" ]; then
    source $ROOT_DIR/frameworks/pytorch/mmengine/install_mmengine.sh
fi

if [ "$WITH_MMCV" = "1" ]; then
    source $ROOT_DIR/frameworks/pytorch/mmcv/install_mmcv.sh
fi

if [ "$WITH_MMPRETRAIN" = "1" ]; then
    source $ROOT_DIR/frameworks/pytorch/mmpretrain/install_mmpretrain.sh
fi

if [ "$WITH_MMDETECTION" = "1" ]; then
    source $ROOT_DIR/frameworks/pytorch/mmdetection/install_mmdetection.sh
fi

if [ "$WITH_MMSEGMENTATION" = "1" ]; then
    source $ROOT_DIR/frameworks/pytorch/mmsegmentation/install_mmsegmentation.sh
fi

if [ "$WITH_MMDEPLOY" = "1" ]; then
    source $ROOT_DIR/frameworks/pytorch/mmdeploy/install_mmdeploy.sh
fi

if [ "$WITH_TENSORFLOW" = "1" ]; then
    source $ROOT_DIR/frameworks/tensorflow/main/install_tensorflow.sh
fi

if [ "$WITH_OPENVINO" = "1" ]; then
    source $ROOT_DIR/additional/openvino/install_openvino.sh
fi

if [ "$WITH_DATASET_CONVERTERS" = "1" ]; then
    source $ROOT_DIR/additional/dataset_converters/install_dataset_converters.sh
fi

if [ "$WITH_FFMPEG" = "1" ]; then
    source $ROOT_DIR/additional/ffmpeg/install_ffmpeg.sh
fi

if [ "$WITH_CRYPTOPP" = "1" ]; then
    source $ROOT_DIR/production/cryptopp/install_cryptopp.sh
fi
