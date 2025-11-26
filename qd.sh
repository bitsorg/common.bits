package: qd
version: "%(tag_basename)s"
tag: "master"
source: https://bitbucket.org/njet/qd-library.git
requires:
  - "GCC-Toolchain:(?!osx)"
  - Python
  
build_requires:
  - bits-recipe-tools
  
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  aclocal
  libtoolize
  automake --add-missing
  autoreconf
  ./configure --prefix=$INSTALLROOT
}
