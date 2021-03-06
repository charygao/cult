#!/bin/sh

if [ -z "${ASMJIT_DIR}" ]; then
  ASMJIT_DIR="../../asmjit"
fi

CURRENT_DIR=`pwd`
BUILD_DIR="build"
BUILD_OPTIONS="-DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DASMJIT_DIR=\"${ASMJIT_DIR}\""

mkdir -p ../${BUILD_DIR}_dbg
mkdir -p ../${BUILD_DIR}_rel

cd ../${BUILD_DIR}_dbg
eval cmake .. -G"Ninja" -DCMAKE_BUILD_TYPE=Debug ${BUILD_OPTIONS}
cd ${CURRENT_DIR}

cd ../${BUILD_DIR}_rel
eval cmake .. -G"Ninja" -DCMAKE_BUILD_TYPE=Release ${BUILD_OPTIONS}
cd ${CURRENT_DIR}_rel
