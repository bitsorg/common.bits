package: cfitsio
version: "%(tag_basename)s" 
tag: cfitsio-4.6.2
source: https://github.com/HEASARC/cfitsio.git
requires:
  - "GCC-Toolchain:(?!osx)"
build_requires:
  - CMake
  - bits-recipe-tools
prefer_system: (?!slc5)
prefer_system_check:
---
#!/bin/bash -e
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
CMAKE_OPTIONS="${IGNORE_ERRORS:+-k}"
##############################
function Configure() {
  ./configure --prefix=$INSTALLROOT
}
