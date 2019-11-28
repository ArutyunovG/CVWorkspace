#!/bin/bash

mkdir -p $UTILS_BASE

wget https://github.com/Kitware/CMake/releases/download/v3.15.2/cmake-3.15.2-Linux-x86_64.tar.gz
tar -zxvf cmake-3.15.2-Linux-x86_64.tar.gz
rm cmake-3.15.2-Linux-x86_64.tar.gz
mv cmake-3.15.2-Linux-x86_64 $UTILS_BASE/cmake

echo 'export PATH=$PATH:$UTILS_BASE/cmake/bin' >> $SETUP_SCRIPT
