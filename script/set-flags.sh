#!/bin/sh

set -ex

export LIBGIT2_PATH=`pwd`/vendor/libgit2
export LIBSSH2_PATH=`pwd`/vendor/libssh2
export OPENSSL_PATH=`pwd`/vendor/openssl

export PKG_CONFIG_PATH="$LIBGIT2_PATH/build:$OPENSSL_PATH/build/lib/pkgconfig:$LIBSSH2_PATH/install/lib/pkgconfig"

FLAGS=$(pkg-config --static --libs --cflags libssh2 libgit2) || exit 1
export CGO_LDFLAGS="$LIBGIT2_PATH/build/libgit2.a $OPENSSL_PATH/libcrypto.a $OPENSSL_PATH/libssl.a $LIBSSH2_PATH/install/lib/libssh2.a -L$LIBGIT2_PATH/build ${FLAGS}"
export CGO_CFLAGS="-I$LIBGIT2_PATH/include"

$@
