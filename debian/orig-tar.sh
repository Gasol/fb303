#!/usr/bin/env sh

set -e

VERSION=$2
ORIG_TAR=$3
PACKAGE=`dpkg-parsechangelog | sed -n 's/^Source: //p'`
DEBIAN_VER=`dpkg-parsechangelog | sed -ne 's/^Version: \([0-9\.]*\).*/\1/p'`
TAR="${PACKAGE}_${DEBIAN_VER}.tar.gz"
ORIG_TAR="${PACKAGE}_${DEBIAN_VER}.orig.tar.gz"
DIR="${PACKAGE}_${VERSION}"
THRIFT_DIR="thrift-$2"
THRIFT_TAR="thrift-$2.tar.gz"

tar zxf $3 -C ../

mkdir -p ../$DIR
cp -r ../$THRIFT_DIR/contrib/fb303/* ../$DIR/
tar czf ../$TAR ../$DIR
ln -sf $TAR ../$ORIG_TAR
rm -rf ../$DIR
rm -rf ../$THRIFT_DIR
rm ../$THRIFT_TAR
