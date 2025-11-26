package: vbfnlo
version: "%(tag_basename)s"
tag: "v3.0"
source: https://github.com/vbfnlo/vbfnlo.git
requires:
  - "GCC-Toolchain:(?!osx)"
  - lhapdf
  - looptools
  - GSL

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
    sed -i 's/doc//g' Makefile.am
    autoreconf -vi
    ./configure --prefix=$INSTALLROOT \
                --with-gsl=$GSL_ROOT \
                --with-LHAPDF=$LHAPDF_ROOT \
                --with-LOOPTOOLS=$LOOPTOOLS_ROOT \
                --enable-shared=no \
		"FCFLAGS=-std=legacy"
		    
}
