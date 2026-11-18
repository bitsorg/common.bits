package: ZeroMQ
version: v4.3.5
source: https://github.com/zeromq/libzmq
requires:
  - "GCC-Toolchain:(?!osx)"
build_requires:
  - "CMake"
  - ninja
  - bits-recipe-tools
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --cmake"
##############################
function Configure() {
  cmake $SOURCEDIR                          \
      -G Ninja                            \
      -DENABLE_WS=OFF                     \
      -DBUILD_TESTS=OFF                   \
      -DCMAKE_INSTALL_LIBDIR=lib          \
      -DCMAKE_INSTALL_PREFIX=$INSTALLROOT
}
function Make() {
   ninja ${JOBS+-j $JOBS} install
}

function MakeInstall() {
   true
}

