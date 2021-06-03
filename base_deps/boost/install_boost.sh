#!/bin/bash

mkdir -p $LIBS_BASE

BOOST_VERSION_UNDERSCORE=$(echo $BOOST_VERSION | sed 's/\./_/g')

py_include_dir=$(python -c 'from sysconfig import get_paths as gp; print(gp()["include"])')
export CPLUS_INCLUDE_PATH="$CPLUS_INCLUDE_PATH:"$py_include_dir

wget https://boostorg.jfrog.io/artifactory/main/release/$BOOST_VERSION/source/boost_$BOOST_VERSION_UNDERSCORE.tar.gz
tar -zxvf boost_$BOOST_VERSION_UNDERSCORE.tar.gz && rm boost_$BOOST_VERSION_UNDERSCORE.tar.gz
cd boost_$BOOST_VERSION_UNDERSCORE
./bootstrap.sh --with-python=$(which python)
./b2 --prefix=install install
cd ..
mv boost_$BOOST_VERSION_UNDERSCORE/install $LIBS_BASE/boost && rm -rf boost_$BOOST_VERSION_UNDERSCORE
pyver=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
ln $LIBS_BASE/boost/lib/libboost_python"$pyver".so $LIBS_BASE/boost/lib/libboost_python.so

echo 'export BOOST_ROOT=$LIBS_BASE/boost' >> $SETUP_SCRIPT
