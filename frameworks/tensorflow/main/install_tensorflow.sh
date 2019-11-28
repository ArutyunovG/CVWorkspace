#!/bin/bash

git clone https://github.com/tensorflow/tensorflow.git
cd tensorflow

git checkout r1.14

export PYTHON_BIN_PATH=$(which python)
export PYTHON_LIB_PATH="$($PYTHON_BIN_PATH -c 'from distutils.sysconfig import get_python_lib; print(get_python_lib())')"
export TF_NEED_CUDA=1
export TF_ENABLE_XLA=0
export TF_NEED_OPENCL=0
export TF_NEED_OPENCL_SYCL=0
export TF_NEED_ROCM=0
export TF_NEED_TENSORRT=0
export TF_CUDA_COMPUTE_CAPABILITIES="$TF_CUDA_ARCH"
export TF_CUDA_CLANG=0
export GCC_HOST_COMPILER_PATH=$(which gcc)
export TF_NEED_MPI=0
export CC_OPT_FLAGS="-march=native -Wno-sign-compare"
export TF_SET_ANDROID_WORKSPACE=0

./configure

mkdir $LIBS_BASE/tensorflow

bazel build --jobs $(nproc) --config=cuda //tensorflow:install_headers 
cp -r bazel-bin/tensorflow/include $LIBS_BASE/tensorflow

bazel clean

bazel build --jobs $(nproc) --config=cuda //tensorflow/tools/pip_package:build_pip_package
./bazel-bin/tensorflow/tools/pip_package/build_pip_package tmp/tensorflow_pkg

python -m pip install tmp/tensorflow_pkg/tensorflow-1.14*

bazel clean

bazel build --jobs $(nproc) --config=cuda //tensorflow:libtensorflow.so

mkdir $LIBS_BASE/tensorflow/lib
cp bazel-bin/tensorflow/libtensorflow* $LIBS_BASE/tensorflow/lib

cd .. && rm -rf tensorflow
