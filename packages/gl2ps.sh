package: gl2ps
version: "%(tag_basename)s" 
tag: "gl2ps_1_4_2"
source: https://gitlab.onelab.info/gl2ps/gl2ps.git
requires:
  - "GCC-Toolchain:(?!osx)"
  - zlib

build_requires:
  - CMake  
  - bits-recipe-tools
prefer_system: (?!slc5)
prefer_system_check:
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
CMAKE_OPTIONS="${IGNORE_ERRORS:+-k}"
##############################
function Prepare() {
    rsync -av --delete --delete-excluded $SOURCEDIR/ ./
}

function Configure() {
    mkdir build && cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=$INSTALLROOT  -DPDFLATEX_COMPILER=
}

function Make() {
     cmake --build . -- ${CMAKE_OPTIONS} ${JOBS:+-j$JOBS}
}

function MakeInstall() {
        cmake --install .
}
