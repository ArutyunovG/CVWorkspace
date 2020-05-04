#!/bin/bash

CUDNN_ARCHIVE=cudnn-10.2-linux-x64-v7.6.5.32.tgz

mkdir cudnn_out
tar -zxvf $CUDNN_ARCHIVE -C cudnn_out
sudo cp cudnn_out/cuda/include/* /usr/local/cuda/include
sudo cp cudnn_out/cuda/lib64/* /usr/local/cuda/lib64
rm -rf cudnn_out
