package: vdt
version: "%(tag_basename)s"
tag: "v0.4.6"
source: https://github.com/dpiparo/vdt.git
requires:
  - "GCC-Toolchain:(?!osx)"

build_requires:
  - CMake
  - bits-recipe-tools
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  cmake $SOURCEDIR -DCMAKE_INSTALL_PREFIX=$INSTALLROOT
}


