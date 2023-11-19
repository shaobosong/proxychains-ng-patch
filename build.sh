#!/bin/sh
SRC_DIR=$PWD
BUILD_DIR=$SRC_DIR/build
INSTALL_DIR=$SRC_DIR/install

rm -rf $BUILD_DIR $INSTALL_DIR

mkdir $BUILD_DIR
cp -rf VERSION Makefile completions src tests tools $BUILD_DIR
cd $BUILD_DIR

# CC=/home/butdraw/riscv/bin/riscv64-unknown-linux-gnu-gcc \
CFLGAS="-O0 -g3" LDFLAGS="-O0 -g3" \
$SRC_DIR/configure \
    --prefix=$INSTALL_DIR \
    --exec_prefix=$INSTALL_DIR \
    --sysconfdir=$INSTALL_DIR

make
# make install