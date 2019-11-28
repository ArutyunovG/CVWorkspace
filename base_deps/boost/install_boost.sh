#!/bin/bash

mkdir -p $LIBS_BASE

py_include_dir=$(python -c 'from sysconfig import get_paths as gp; print(gp()["include"])')
export CPLUS_INCLUDE_PATH="$CPLUS_INCLUDE_PATH:"$py_include_dir

wget http://sourceforge.net/projects/boost/files/boost/1.69.0/boost_1_69_0.tar.gz
tar -zxvf boost_1_69_0.tar.gz && rm boost_1_69_0.tar.gz
cd boost_1_69_0
./bootstrap.sh --with-python=$(which python)
./b2 --prefix=install install
cd ..
mv boost_1_69_0/install $LIBS_BASE/boost && rm -rf boost_1_69_0
pyver=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
ln $LIBS_BASE/boost/lib/libboost_python"$pyver".so $LIBS_BASE/boost/lib/libboost_python.so

echo 'export BOOST_ROOT=$LIBS_BASE/boost' >> $SETUP_SCRIPT
