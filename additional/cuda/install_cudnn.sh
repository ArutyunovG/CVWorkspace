#!/bin/bash

CUDNN_ARCHIVE=cudnn-11.3-linux-x64-v8.2.0.53.tgz

mkdir cudnn_out
tar -zxvf $CUDNN_ARCHIVE -C cudnn_out
sudo cp cudnn_out/cuda/include/* /usr/local/cuda/include
sudo cp cudnn_out/cuda/lib64/* /usr/local/cuda/lib64
rm -rf cudnn_out
