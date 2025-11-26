package: rangev3
version: "%(tag_basename)s"
tag: "0.12.0"
source: https://github.com/ericniebler/range-v3.git
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
    rsync -av --delete --delete-excluded $SOURCEDIR/ ./
}

function Configure() {
    cmake -DCMAKE_INSTALL_PREFIX=$INSTALLROOT \
        -DBUILD_TESTING=OFF \
        -DRANGE_V3_TESTS=OFF \
        -DRANGE_V3_DOCS=OFF \
        -DRANGE_V3_EXAMPLES=OFF \
        -DRANGE_V3_PERF=OFF
}

function Make() {
        cmake --build . -- ${CMAKE_OPTIONS} ${JOBS:+-j$JOBS}
}

function MakeInstall() {
        cmake --install .
}

function PostInstall() {
  echo "setenv RANGEV3_INCLUDE_DIR \$PKG_ROOT" >> $MODULEFILE
}
