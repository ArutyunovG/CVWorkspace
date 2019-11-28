#!/bin/bash

git clone --recursive https://github.com/FFmpeg/FFmpeg.git
cd FFmpeg && git checkout release/4.2
./configure --disable-static --enable-shared --disable-gpl --disable-x86asm --prefix=install
make -j$(nproc) install
cd .. && mv FFmpeg/install $LIBS_BASE/ffmpeg && rm -rf FFmpeg
ln -s $LIBS_BASE/ffmpeg/bin $UTILS_BASE/ffmpeg
echo 'export FFMPEG_DIR=$LIBS_BASE/ffmpeg' >> $SETUP_SCRIPT
echo 'export PATH=$PATH:$UTILS_BASE/ffmpeg' >> $SETUP_SCRIPT
echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$FFMPEG_DIR/lib' >> $SETUP_SCRIPT
