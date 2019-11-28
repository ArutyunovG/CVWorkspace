#!/bin/bash

sudo apt-get install -yq pkg-config zip g++ unzip
wget https://github.com/bazelbuild/bazel/releases/download/0.26.1/bazel-0.26.1-installer-linux-x86_64.sh
chmod +x bazel-0.26.1-installer-linux-x86_64.sh
./bazel-0.26.1-installer-linux-x86_64.sh --prefix=$UTILS_BASE/bazel
rm bazel-0.26.1-installer-linux-x86_64.sh

echo 'export PATH=$PATH:$UTILS_BASE/bazel/bin' >> $SETUP_SCRIPT
