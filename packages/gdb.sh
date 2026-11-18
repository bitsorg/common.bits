package: gdb
version: "%(tag_basename)s"
tag: "gdb-16.3-release"
source: https://github.com/bminor/binutils-gdb.git
requires:
  - "GCC-Toolchain:(?!osx)"
  - GMP
  - MPFR
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
    ./configure --with-gmp=$GMP_ROOT --with-mpfr=$MPFR_ROOT --without-xxhash  --prefix=$INSTALLROOT
}
