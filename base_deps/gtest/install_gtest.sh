#!/bin/bash

mkdir -p $LIBS_BASE

git clone --recursive https://github.com/google/googletest.git -b release-1.10.0
mv googletest $LIBS_BASE/googletest
