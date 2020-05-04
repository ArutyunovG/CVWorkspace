#!/bin/bash

export LC_ALL=C.UTF-8
export LANG=C.UTF-8

#
# WORKSPACE_BASE specifies folder for installation
# almost all libs, utils, python deps are installed there
#
WORKSPACE_BASE=$HOME/cv_workspace

LIBS_BASE=$WORKSPACE_BASE/libs
UTILS_BASE=$WORKSPACE_BASE/utils

export LIBS_BASE=$LIBS_BASE
export UTILS_BASE=$UTILS_BASE

#
# this script will be used to setup environment
#
SETUP_SCRIPT=$LIBS_BASE/setup.sh

# this sets virtualenv folder for pipenv
export WORKON_HOME=$LIBS_BASE/pipenv/.venvs

#
# If set $HOME/.bashrc will source $LIBS_BASE/setup.sh.
# I.e. your enviornment will be loaded on every bash start.
#
SOURCE_SETUP_SCRIPT_IN_BASHRC=0

#
# Enable tests for most of the frameworks
# It slows down the build process,
# but assures nothing went wrong
#
ENABLE_TESTS=0

#
# These are cuda architectures built by default
#
# If they are not your compute capabilities,
# you can change them here
#
# You can find your GPU's compute capability in Wikipedia
# https://en.wikipedia.org/wiki/CUDA#GPUs_supported
#
CUDA_ARCH="61 75"

#----------------------------------
# ------- Base dependencies -------
#----------------------------------

# These base deps have to be built once
BUILD_BASE_DEPS=0

#----------------------------------
# ----------- Frameworks ----------
#----------------------------------

# Caffe

# Build bvlc/Caffe master branch
BUILD_CAFFE=0

# Build Caffe SSD fork
BUILD_CAFFE_SSD=0

#----------------------------------

# Cafffe2

# Build Caffe2 framework
BUILD_CAFFE2=0

# Build Detectron
BUILD_DETECTRON=0

#----------------------------------

# MXNet

# Build MXNet framework
BUILD_MXNET=0

# Install GluonCV
BUILD_GLUON=0

#----------------------------------

# Pytorch

# Build PyTorch framework
BUILD_PYTORCH=0

# Build torchvision
BUILD_TORCHVISION=0

# Build apex
BUILD_APEX=0

# Instal fvcore
INSTALL_FVCORE=0

# Build Detectron
BUILD_DETECTRON2=0

#----------------------------------

# Build Tensorflow framework
BUILD_TENSORFLOW=0

# Build Tensorflow Object Detection API
BUILD_TF_OD_API=0

#----------------------------------
# ------ Additional CV tools-------
#----------------------------------

#
# Build OpenVINO for inference on Intel devices
#

BUILD_OPENVINO=0

#
# Install dataset converters for various
# object detection and instance segmentation formats
#
INSTALL_DATASET_CONVERTERS=0

# Build ffmpeg
BUILD_FFMPEG=0

#----------------------------------
# - Libs for Production Deployment-
#----------------------------------

#
# Cyptopp lib can be used to encrypt 
# your trained models
#
BUILD_CRYPTOPP=0

