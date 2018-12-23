# CMake starter project
[CMake](https://cmake.org/) starter. Project creates static and shared library as separate packages. The library sources are defined `src/lib` folder. Simple test app is available in `src/app` and `src/tests` includes library unit tests. The unit tests are built on top of [GoogleTest](https://github.com/google/googletest) which is included as external CMake project, see [here](https://github.com/jojanper/cmake-starter/blob/master/extProjects/gtest/CMakeLists.txt) for details.

## Quickstart

### Build code
```
sh ./build.sh Release
```
