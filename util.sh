#!/bin/bash

#
# all of this parsing is needed to get conversions
# like "61 75" -> "6.1 7.5" for compute caps.
# different frameworks have different formats
# for compute caps specification
#

IFS=' ' read -ra compute_caps <<< "$CUDA_ARCH"
CUDA_ARCH_LIST_DOT=""
for i in "${compute_caps[@]}"; do
    dot_style_cap="${i:0:1}.${i:1:1}"
    CUDA_ARCH_LIST_DOT="${CUDA_ARCH_LIST_DOT} ${dot_style_cap}"
    unset dot_style_cap
done
unset compute_caps

#remove first space
CUDA_ARCH_LIST_DOT="${CUDA_ARCH_LIST_DOT:1}"

IFS=' ' read -ra compute_caps <<< "$CUDA_ARCH_LIST_DOT"
TF_CUDA_ARCH=""
MXNET_CUDA_ARCH=""
for i in "${compute_caps[@]}"; do
    TF_CUDA_ARCH="${TF_CUDA_ARCH},${i}"
    MXNET_CUDA_ARCH="${MXNET_CUDA_ARCH};${i}+PTX"
done
unset compute_caps

#remove first separator
TF_CUDA_ARCH="${TF_CUDA_ARCH:1}"
MXNET_CUDA_ARCH="${MXNET_CUDA_ARCH:1}"

CAFFE_CUDA_ARCH=$CUDA_ARCH
TORCH_CUDA_ARCH=$CUDA_ARCH_LIST_DOT
