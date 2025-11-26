package: rapidyaml
version: "%(tag_basename)s"
tag: "v0.7.0"
source: https://github.com/biojppm/rapidyaml.git
requires:
  - "GCC-Toolchain:(?!osx)"
  
build_requires:
  - CMake
  - bits-recipe-tools
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Prepare() {
    (cd $SOURCEDIR; git submodule update --init --recursive) 
    rsync -av --delete --delete-excluded $SOURCEDIR/ ./
}
function Configure() {
  cmake . -DCMAKE_INSTALL_PREFIX=$INSTALLROOT     \
          -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}  \
          -DBUILD_SHARED_LIBS=ON

}
function Make() {
     cmake --build  . -- ${CMAKE_OPTIONS} ${JOBS:+-j$JOBS}
}

function MakeInstall() {
      cmake --install . 
}


