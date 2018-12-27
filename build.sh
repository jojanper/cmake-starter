#!/bin/bash
#
# Build code using CMake.
#
BUILD_TYPE=${1-'Debug'}
BUILD_DIR=${2-'build'}
CWD=`pwd`

echo ${CWD}

rm -Rf ${BUILD_DIR}/*
mkdir -p ${BUILD_DIR}
cmake -H. -B./${BUILD_DIR} -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON -DCMAKE_BUILD_TYPE=${BUILD_TYPE}
cd ${BUILD_DIR}
cmake --build . --config ${BUILD_TYPE}
cpack -C ${BUILD_TYPE}
ctest --verbose

# Test shared package
echo ${CWD}
rm -Rf zip_package
mkdir -p zip_package
cd zip_package
rm -Rf *
unzip ../cdraaloptions-Linux-${BUILD_TYPE}-0.1.0-shared.zip
rm -Rf ${BUILD_DIR}/*
mkdir -p ${BUILD_DIR}
cmake -H../../src/tests/public -B./${BUILD_DIR} -DPACKAGE_PREFIX=${CWD}/build/zip_package -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON -DCMAKE_BUILD_TYPE=${BUILD_TYPE}
cd ${BUILD_DIR}
cmake --build . --config ${BUILD_TYPE}

cd ..
cd ..

# Test static package
rm -Rf zip_package
mkdir -p zip_package
cd zip_package
rm -Rf *
unzip ../cdraaloptions-Linux-${BUILD_TYPE}-0.1.0-static.zip
rm -Rf ${BUILD_DIR}/*
mkdir -p ${BUILD_DIR}
cmake -H../../src/tests/public -B./${BUILD_DIR} -DSHARED_PACKAGE=OFF -DPACKAGE_PREFIX=${CWD}/build/zip_package -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON -DCMAKE_BUILD_TYPE=${BUILD_TYPE}
cd ${BUILD_DIR}
cmake --build . --config ${BUILD_TYPE}
