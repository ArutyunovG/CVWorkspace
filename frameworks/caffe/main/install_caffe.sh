#!/bin/bash

git clone $CAFFE_URL
cd caffe && git checkout $CAFFE_CHECKOUT_TARGET

if [ -n "$CAFFE_PATCH" ]; then
    git apply $CAFFE_PATCH
fi

mkdir build && cd build
cmake .. \
    -DCMAKE_BUILD_TYPE=$CAFFE_BUILD_TYPE \
    -DCMAKE_INSTALL_PREFIX=install \
    -DBUILD_python=ON \
    -DCPU_ONLY=OFF \
    -DUSE_CUDNN=OFF \
    -DProtobuf_INCLUDE_DIR=$LIBS_BASE/protobuf/include \
    -DProtobuf_LIBRARY=$LIBS_BASE/protobuf/lib/libprotobuf.so \
    -DGFLAGS_INCLUDE_DIR=$LIBS_BASE/gflags/include \
    -DGFLAGS_LIBRARY=$LIBS_BASE/gflags/lib/libgflags.so \
    -DGLOG_INCLUDE_DIR=$LIBS_BASE/glog/include \
    -DGLOG_LIBRARY=$LIBS_BASE/glog/lib/libglog.so \
    -DSnappy_INCLUDE_DIR=$LIBS_BASE/snappy/include \
    -DSnappy_LIBRARIES=$LIBS_BASE/snappy/lib/libsnappy.so \
    -DOpenCV_DIR=$LIBS_BASE/opencv3/share/OpenCV \
    -DBLAS=Open \
    -DCUDA_ARCH_NAME="Manual" \
    -DCUDA_ARCH_BIN="$CAFFE_CUDA_ARCH" \
    -DCUDA_ARCH_PTX="$CAFFE_CUDA_ARCH" \
    -DCMAKE_CXX_FLAGS="-std=c++17 -fpermissive -pthread -Wno-deprecated-declarations" \
    -DPYTHON_EXECUTABLE=$(which python)

if [ "$ENABLE_TESTS" = "1" ]; then
    make -j$(nproc) runtest
fi
make -j$(nproc) install
cd ../.. && mv caffe/build/install $LIBS_BASE/caffe && rm -rf caffe

if [ $CAFFE_BUILD_TYPE = "Debug" ]; then
    mv $LIBS_BASE/caffe/python/caffe/_caffe-d.so $LIBS_BASE/caffe/python/caffe/_caffe.so
fi

echo 'export PATH=$PATH:$LIBS_BASE/caffe/bin' >> $SETUP_SCRIPT
echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$LIBS_BASE/caffe/lib' >> $SETUP_SCRIPT
echo 'export PYTHONPATH=$PYTHONPATH:$LIBS_BASE/caffe/python' >> $SETUP_SCRIPT
echo 'export CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:$LIBS_BASE/caffe/share/Caffe' >> $SETUP_SCRIPT
