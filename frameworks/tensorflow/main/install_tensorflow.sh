#!/bin/bash

git clone $TENSORFLOW_URL
cd tensorflow

git checkout $TENSORFLOW_CHECKOUT_TARGET

if [ -n "$TENSORFLOW_PATCH" ]; then
    git apply $TENSORFLOW_PATCH
fi

export PYTHON_BIN_PATH=$(which python)
export PYTHON_LIB_PATH="$($PYTHON_BIN_PATH -c 'from distutils.sysconfig import get_python_lib; print(get_python_lib())')"
export TF_NEED_ROCM=0
export TF_NEED_CUDA=1
export TF_NEED_TENSORRT=0
export TF_ENABLE_XLA=0
export TF_NEED_OPENCL=0
export TF_NEED_OPENCL_SYCL=0
export TF_CUDA_COMPUTE_CAPABILITIES="$TF_CUDA_ARCH"
export TF_CUDA_CLANG=0
export GCC_HOST_COMPILER_PATH=$(which gcc)
export TF_NEED_MPI=0
export CC_OPT_FLAGS="-march=native -Wno-sign-compare"
export TF_SET_ANDROID_WORKSPACE=0
export TF_PYTHON_VERSION=$(python -c "import sys; print(f'{sys.version_info[0]}.{sys.version_info[1]}')")

./configure

mkdir $LIBS_BASE/tensorflow

cp -r bazel-bin/tensorflow/include $LIBS_BASE/tensorflow

if [ $TENSORFLOW_BUILD_TYPE = "Debug" ]; then
    bazel build --jobs $(nproc) --config=cuda --copt="-O0" --copt="-g" //tensorflow/tools/pip_package:build_pip_package
fi

if [ $TENSORFLOW_BUILD_TYPE = "RelWithDebInfo" ]; then
    bazel build --jobs $(nproc) --config=cuda  --copt="-g" //tensorflow/tools/pip_package:build_pip_package 
fi

if [ $TENSORFLOW_BUILD_TYPE = "Release" ]; then
    bazel build --jobs $(nproc) --config=cuda //tensorflow/tools/pip_package:build_pip_package
fi

./bazel-bin/tensorflow/tools/pip_package/build_pip_package tmp/tensorflow_pkg

python -m pip install tmp/tensorflow_pkg/tensorflow-$TENSORFLOW_VERSION*

cd .. && rm -rf tensorflow
