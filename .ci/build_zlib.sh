#!/usr/bin/env bash
#
# Compile zlib for static linking.
#
set -e

curl -o zlib.tar.gz https://www.zlib.net/zlib-1.2.11.tar.gz

tar -xzf zlib.tar.gz
pushd zlib-1.2.11

if [[ "$PLATFORM" == "windows"* ]]; then
  ZLIB_LIBRARY_DIR=$(pwd)/build/
  CFLAGS=""
else
  ZLIB_LIBRARY_DIR=$(pwd)/build/
  CFLAGS="-fPIC"
fi

ZLIB_INCLUDE_DIR="$(pwd)"

mkdir build
pushd build
CFLAGS=$CFLAGS cmake ..
cmake --build . --target zlibstatic
cp zconf.h ..
popd

find . -name "*.a"
find . -name "*.lib"

# used by setup.py
echo "ZLIB_INCLUDE_DIR=$ZLIB_INCLUDE_DIR" >> "$GITHUB_ENV"
echo "ZLIB_LIBRARY_DIR=$ZLIB_LIBRARY_DIR" >> "$GITHUB_ENV"
echo "ZLIB_STATIC=1"                      >> "$GITHUB_ENV"

popd
