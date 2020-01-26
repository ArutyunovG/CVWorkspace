#!/bin/bash

mkdir -p $LIBS_BASE

git clone --recursive https://github.com/google/googletest.git -b release-$GTEST_VERSION
mv googletest $LIBS_BASE/googletest
