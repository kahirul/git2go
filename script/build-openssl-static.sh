#!/bin/sh

set -ex

VENDORED_PATH=vendor/openssl

cd $VENDORED_PATH &&
git checkout OpenSSL_1_0_2-stable &&

mkdir -p build &&

./config threads no-shared \
  --prefix=`pwd`/build \
  --openssldir=`pwd`/build \
  -Wl,-rpath,'$(LIBRPATH)' \
  -fPIC &&

make depend &&
make &&
make install
