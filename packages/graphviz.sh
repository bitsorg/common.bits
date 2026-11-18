package: graphviz
version: "%(tag_basename)s" 
tag: "13.1.0"
source: https://gitlab.com/graphviz/graphviz.git
requires:
  - "GCC-Toolchain:(?!osx)"
build_requires:
  - bits-recipe-tools
  - cairo
  - expat
  - fontconfig
  - libpng
  - zlib

prefer_system: (?!slc5)
prefer_system_check:
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
CMAKE_OPTIONS="${IGNORE_ERRORS:+-k}"
##############################
function Configure() {
    ./autogen.sh
    ./configure --prefix=$INSTALLROOT
}
