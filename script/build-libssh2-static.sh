#!/bin/sh

set -ex

VENDORED_PATH=vendor/libssh2

cd $VENDORED_PATH &&
mkdir -p install/lib &&
mkdir -p build &&

cd build &&

cmake -DBUILD_SHARED_LIBS=OFF \
      -DCMAKE_C_FLAGS=-fPIC \
      -DCMAKE_BUILD_TYPE="RelWithDebInfo" \
      -DCMAKE_INSTALL_PREFIX=../install \
      -DCMAKE_OSX_ARCHITECTURES=x86_64 \
      -DCRYPTO_BACKEND=OpenSSL \
      -DOPENSSL_ROOT_DIR=../../openssl/build/lib \
      -DOPENSSL_INCLUDE_DIR=../../openssl/build/include \
      -LIBSCRYPTO=../../openssl/build/lib/libcrypto.a \
      .. &&

cmake --build . &&

make &&
make install