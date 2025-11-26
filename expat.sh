package: expat
version: "2.2.6"
tag: R_2_2_6
source: https://github.com/libexpat/libexpat.git
requires:
  - "GCC-Toolchain:(?!osx)"
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
CMAKE_ARGS="-DCMAKE_INSTALL_PREFIX=$INSTALLROOT -DBUILD_doc=OFF"
##############################
