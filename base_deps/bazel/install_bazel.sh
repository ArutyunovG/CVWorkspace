#!/bin/bash

sudo apt-get install -yq pkg-config zip g++ unzip
wget https://github.com/bazelbuild/bazel/releases/download/$BAZEL_VERSION/bazel-$BAZEL_VERSION-installer-linux-x86_64.sh
chmod +x bazel-$BAZEL_VERSION-installer-linux-x86_64.sh
./bazel-$BAZEL_VERSION-installer-linux-x86_64.sh --prefix=$UTILS_BASE/bazel
rm bazel-$BAZEL_VERSION-installer-linux-x86_64.sh

echo 'export PATH=$PATH:$UTILS_BASE/bazel/bin' >> $SETUP_SCRIPT
