package: harfbuzz
version: "%(tag_basename)s"
tag: "11.2.1"
source: https://github.com/harfbuzz/harfbuzz.git
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
    cmake .. -DCMAKE_INSTALL_PREFIX=$INSTALLROOT
 }

function Make() {
     cmake --build . -- ${CMAKE_OPTIONS} ${JOBS:+-j$JOBS}
}

function MakeInstall() {
        cmake --install . 
}
