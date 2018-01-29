#!/bin/sh

set -ex

VENDORED_PATH=`pwd`/vendor/libgit2
LIBSSH2_PATH=`pwd`/vendor/libssh2
OPENSSL_PATH=`pwd`/vendor/openssl

export PKG_CONFIG_PATH="$OPENSSL_PATH/build/lib/pkgconfig:$LIBSSH2_PATH/install/lib/pkgconfig/"

cd $VENDORED_PATH &&
mkdir -p install/lib &&
mkdir -p build &&

cd build &&

pkg-config --libs libssh2

cmake -DTHREADSAFE=ON \
      -DBUILD_CLAR=OFF \
      -DBUILD_SHARED_LIBS=OFF \
      -DCMAKE_C_FLAGS=-fPIC \
      -DCMAKE_BUILD_TYPE="RelWithDebInfo" \
      -DCMAKE_INSTALL_PREFIX=../install \
      -DCMAKE_OSX_ARCHITECTURES=x86_64 \
      -LIBSSH2_INCLUDE_DIRS=$LIBSSH2_PATH/install/lib/ \
      .. &&

cmake --build . &&

make &&
make install
