#!/bin/bash

mkdir -p $LIBS_BASE

if [ "$WITH_OPENCV4" -eq "1" ]; then

    git clone --recursive https://github.com/opencv/opencv.git
    cd opencv

    git checkout $OPENCV4_VERSION
    mkdir build && cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=install -DWITH_OPENCL=OFF -DWITH_CUDA=OFF
    make -j$(nproc) install
    cd ../.. && mv opencv/build/install $LIBS_BASE/opencv4 && rm -rf opencv

    echo 'export CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:$LIBS_BASE/opencv4/lib/cmake/opencv4' >> $SETUP_SCRIPT
    echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$LIBS_BASE/opencv4/lib' >> $SETUP_SCRIPT

fi

if [ "$WITH_OPENCV3" -eq "1" ]; then

    git clone --recursive https://github.com/opencv/opencv.git
    cd opencv

    git checkout $OPENCV3_VERSION
    mkdir build && cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=install -DWITH_OPENCL=OFF -DWITH_CUDA=OFF
    make -j$(nproc) install
    cd ../.. && mv opencv/build/install $LIBS_BASE/opencv3 && rm -rf opencv

    # we prefer OpenCV4, if it also was selected
    if [ "$WITH_OPENCV4" != "1" ]; then    
        echo 'export CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:$LIBS_BASE/opencv3/share/OpenCV' >> $SETUP_SCRIPT
        echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$LIBS_BASE/opencv3/lib' >> $SETUP_SCRIPT
    fi

fi
