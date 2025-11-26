package: cppgsl
version: "%(tag_basename)s"
tag: "v3.1.0"
source: https://github.com/Microsoft/GSL.git
requires:
  - "GCC-Toolchain:(?!osx)"
build_requires:
  - bits-recipe-tools
  - CMake
prefer_system: (?!slc5)
prefer_system_check:
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Prepare() {
    rsync -av --delete --delete-excluded $SOURCEDIR/ ./
}

function Configure() {
  mkdir build && cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=$INSTALLROOT -DGSL_TEST=OFF
}

function Make() {
  cmake --build . -- ${CMAKE_OPTIONS} ${JOBS:+-j$JOBS}
}

function MakeInstall() {
  cmake --install .
}

function PostInstall() {
  echo "setenv CPPGSL_ROOT \$PKG_ROOT" >> $MODULEFILE
}
