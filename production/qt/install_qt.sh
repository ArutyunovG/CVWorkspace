#!/bin/bash

sudo apt install -yq wget libsm6 libice6 libxext6 libxrender1 libfontconfig1 libdbus-1-3 libx11-xcb1
wget https://download.qt.io/official_releases/qt/${QT_VERSION%.*}/$QT_VERSION/qt-opensource-linux-x64-$QT_VERSION.run
chmod +x qt-opensource-linux-x64-$QT_VERSION.run
./qt-opensource-linux-x64-$QT_VERSION.run --script $ROOT_DIR/production/qt/qt-installer-noninteractive.qs --platform minimal
rm -rf qt-opensource-linux-x64-$QT_VERSION.run
echo 'export CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:$LIBS_BASE/qt/'$QT_VERSION'/gcc_64/lib/cmake/Qt5' >> $SETUP_SCRIPT
echo 'export PATH=$PATH:$LIBS_BASE/qt/Tools/QtCreator/bin' >> $SETUP_SCRIPT
