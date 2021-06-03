#!/bin/bash -ex

cd /pcsx2

mkdir build && cd build || exit 1

cmake ..                                        \
    -DCMAKE_C_COMPILER=/usr/lib/ccache/gcc      \
    -DCMAKE_CXX_COMPILER=/usr/lib/ccache/g++    \
    -DCMAKE_BUILD_TYPE=Release                  \
    -DPACKAGE_MODE=TRUE                         \
    -DXDG_STD=TRUE                              \
    -DDISABLE_ADVANCE_SIMD=TRUE                 \
    -DCMAKE_INSTALL_LIBDIR="/tmp/"              \
    -DCMAKE_INSTALL_DATADIR="/tmp/"             \
    -G Ninja
    
    #-DGTK3_API=TRUE                            \
    

ninja


cp ../.github/workflows/scripts/linux/appimage.sh /tmp
cd /tmp
./appimage.sh
