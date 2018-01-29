#!/bin/sh

set -ex

LIBGIT2_PATH=`pwd`/vendor/libgit2
LIBSSH2_PATH=`pwd`/vendor/libssh2
OPENSSL_PATH=`pwd`/vendor/openssl

rm -fr $LIBGIT2_PATH/build/*
rm -fr $LIBSSH2_PATH/build/*
rm -fr $OPENSSL_PATH/build/*