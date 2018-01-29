#!/bin/sh

VENDORED_PATH=vendor/openssl

cd $VENDORED_PATH &&
git checkout OpenSSL_1_0_2-stable &&

mkdir -p build &&
rm -fr build/* &&

./Configure darwin64-x86_64-cc threads no-shared enable-ec_nistp_64_gcc_128 \
  --prefix=`pwd`/build \
  --openssldir=`pwd`/build \
  -Wl,-rpath,'$(LIBRPATH)' \
  -fPIC -DOPENSSL_PIC &&

make depend &&
make &&
make install
