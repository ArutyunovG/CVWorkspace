#!/bin/bash

#
# With these variables you can specify detailed configuration of base dependencies
#
# Note, that you can easily break CVWorkspace structure and 
# you are expected to understand what you are doing with these adjustments
#

: ${WITH_PYTHON_DEPS:=$WITH_BASE_DEPS}
: ${WITH_PIPFILE:=}
: ${WITH_COCO_API:=$WITH_BASE_DEPS}

: ${WITH_CMAKE:=$WITH_BASE_DEPS}
: ${WITH_BAZEL:=$WITH_BASE_DEPS}

: ${WITH_BOOST:=$WITH_BASE_DEPS}
: ${WITH_OPENCV:=$WITH_BASE_DEPS}
: ${WITH_OPENCV3:=$WITH_OPENCV}
: ${WITH_OPENCV4:=$WITH_OPENCV}
: ${WITH_ZLIB:=$WITH_BASE_DEPS}
: ${WITH_PROTOBUF:=$WITH_BASE_DEPS}
: ${WITH_GFLAGS:=$WITH_BASE_DEPS}
: ${WITH_GLOG:=$WITH_BASE_DEPS}
: ${WITH_LEVELDB:=$WITH_BASE_DEPS}
: ${WITH_LMDB:=$WITH_BASE_DEPS}
: ${WITH_HDF5:=$WITH_BASE_DEPS}
: ${WITH_OPENBLAS:=$WITH_BASE_DEPS}
: ${WITH_SNAPPY:=$WITH_BASE_DEPS}
: ${WITH_GTEST:=$WITH_BASE_DEPS}

# allow passing relative path to a pipfile
# this is utility
if [ -n "$WITH_PIPFILE" ]; then
    WITH_PIPFILE=$(realpath $WITH_PIPFILE)
fi
