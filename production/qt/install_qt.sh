#!/bin/bash

sudo apt install -yq wget libsm6 libice6 libxext6 libxrender1 libfontconfig1 libdbus-1-3 libx11-xcb1
wget https://download.qt.io/official_releases/qt/5.12/5.12.0/qt-opensource-linux-x64-5.12.0.run
chmod +x qt-opensource-linux-x64-5.12.0.run
./qt-opensource-linux-x64-5.12.0.run --script $ROOT_DIR/production/qt/qt-installer-noninteractive.qs --platform minimal
rm -rf qt-opensource-linux-x64-5.12.0.run
echo 'export CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:$LIBS_BASE/qt/5.12.0/gcc_64/lib/cmake/Qt5' >> $SETUP_SCRIPT
echo 'export PATH=$PATH:$LIBS_BASE/qt/Tools/QtCreator/bin' >> $SETUP_SCRIPT
