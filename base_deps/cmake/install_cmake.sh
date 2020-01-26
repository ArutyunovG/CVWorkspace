#!/bin/bash

mkdir -p $UTILS_BASE

wget https://github.com/Kitware/CMake/releases/download/v$CMAKE_VERSION/cmake-$CMAKE_VERSION-Linux-x86_64.tar.gz
tar -zxvf cmake-$CMAKE_VERSION-Linux-x86_64.tar.gz
rm cmake-$CMAKE_VERSION-Linux-x86_64.tar.gz
mv cmake-$CMAKE_VERSION-Linux-x86_64 $UTILS_BASE/cmake

echo 'export PATH=$PATH:$UTILS_BASE/cmake/bin' >> $SETUP_SCRIPT
