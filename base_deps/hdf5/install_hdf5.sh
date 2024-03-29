git clone --recursive https://github.com/HDFGroup/hdf5.git
cd hdf5 && git checkout hdf5-$(echo $HDF5_VERSION | sed 's/\./_/g')
mkdir build && cd build
cmake .. -DCMAKE_INSTALL_PREFIX=install \
         -DHDF5_ENABLE_Z_LIB_SUPPORT=ON \
         -DZLIB_INCLUDE_DIR=$LIBS_BASE/zlib/include \
         -DZLIB_LIBRARY=$LIBS_BASE/zlib/lib/libz.so
make -j$(nproc) install
cd ../.. && mv hdf5/build/install $LIBS_BASE/hdf5 && rm -rf hdf5

echo 'export HDF5_ROOT=$LIBS_BASE/hdf5' >> $SETUP_SCRIPT
