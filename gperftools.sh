package: gperftools
version: "%(tag_basename)s"
tag: "gperftools-2.16"
source: https://github.com/gperftools/gperftools.git
requires:
  - "GCC-Toolchain:(?!osx)"
build_requires:
  - CMake
  - bits-recipe-tools
prefer_system: (?!slc5)
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
    ./autogen.sh
    ./configure --prefix=$INSTALLROOT
}

