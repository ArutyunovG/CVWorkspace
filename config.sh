#!/bin/bash

export LC_ALL=C.UTF-8
export LANG=C.UTF-8

#
# WORKSPACE_BASE specifies folder for installation
# almost all libs, utils, python deps are installed there
#
: ${WORKSPACE_BASE:=$HOME/cv_workspace}

: ${LIBS_BASE:=$WORKSPACE_BASE/libs}
: ${UTILS_BASE:=$WORKSPACE_BASE/utils}

export LIBS_BASE=$LIBS_BASE
export UTILS_BASE=$UTILS_BASE

#
# this script will be used to setup environment
#
: ${SETUP_SCRIPT:=$LIBS_BASE/setup.sh}

# this sets virtualenv folder for pipenv
export WORKON_HOME=$LIBS_BASE/pipenv/.venvs

#
# If set $HOME/.bashrc will source $LIBS_BASE/setup.sh.
# I.e. your enviornment will be loaded on every bash start.
#
: ${SOURCE_SETUP_SCRIPT_IN_BASHRC:=0}

#
# Enable tests for most of the frameworks
# It slows down the build process,
# but assures nothing went wrong
#
: ${ENABLE_TESTS:=0}

#
# These are cuda architectures built by default
#
# If they are not your compute capabilities,
# you can change them here
#
# You can find your GPU's compute capability in Wikipedia
# https://en.wikipedia.org/wiki/CUDA#GPUs_supported
#
: ${CUDA_ARCH:="89"}

#----------------------------------
# ------- Base dependencies -------
#----------------------------------

# These base deps have to be built once
: ${WITH_BASE_DEPS:=0}

#----------------------------------
# ----------- Frameworks ----------
#----------------------------------

# Caffe

# Build bvlc/Caffe master branch
: ${WITH_CAFFE:=0}

# Build Caffe SSD fork
: ${WITH_CAFFE_SSD:=0}

#----------------------------------

# Cafffe2

# Build Caffe2 framework
: ${WITH_CAFFE2:=0}

# Build Detectron
: ${WITH_DETECTRON:=0}

#----------------------------------

# MXNet

# Build MXNet framework
: ${WITH_MXNET:=0}

# Install GluonCV
: ${WITH_GLUONCV:=0}

#----------------------------------

# Pytorch

# Build PyTorch framework
: ${WITH_PYTORCH:=0}

# Build torchvision
: ${WITH_TORCHVISION:=0}

# Build apex
: ${WITH_APEX:=0}

# Install fvcore
: ${WITH_FVCORE:=0}

# Build Detectron
: ${WITH_DETECTRON2:=0}

# Install ClassyVision
: ${WITH_CLASSYVISION:=0}

#----------------------------------

# Build Tensorflow framework
: ${WITH_TENSORFLOW:=0}

# Build Tensorflow Object Detection API
: ${WITH_TF_OD_API:=0}

#----------------------------------
# ------ Additional CV tools-------
#----------------------------------

#
# Build OpenVINO for inference on Intel devices
#
: ${WITH_OPENVINO:=0}

#
# Install dataset converters for various
# object detection and instance segmentation formats
#
: ${WITH_DATASET_CONVERTERS:=0}

# Build ffmpeg
: ${WITH_FFMPEG:=0}

#----------------------------------
# - Libs for Production Deployment-
#----------------------------------

#
# Cyptopp lib can be used to encrypt 
# your trained models
#
: ${WITH_CRYPTOPP:=0}
