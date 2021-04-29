#!/bin/bash

mkdir -p $UTILS_BASE

wget https://github.com/Kitware/CMake/releases/download/v$CMAKE_VERSION/cmake-$CMAKE_VERSION-Linux-x86_64.tar.gz
cmake_archive=$(ls | grep -E "cmake-"$CMAKE_VERSION"-[L|l]inux-x86_64" )
tar -zxvf $cmake_archive
rm $cmake_archive
cmake_extracted_folder=$(ls | grep -E "cmake-"$CMAKE_VERSION"-[L|l]inux-x86_64" )
mv $cmake_extracted_folder $UTILS_BASE/cmake

echo 'export PATH=$PATH:$UTILS_BASE/cmake/bin' >> $SETUP_SCRIPT
