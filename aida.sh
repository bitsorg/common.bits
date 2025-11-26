package: AIDA
version: "%(tag_basename)s"
tag: "v3.2.1"
source: https://github.com/bitslcg/AIDA.git
requires:
  - "GCC-Toolchain:(?!osx)"
  
build_requires:
  - bits-recipe-tools
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--lib --bin" 
##############################
function Configure() {
    :;
}

function Make() {
    :;
}

function MakeInstall() {
    cp -r $BUILDDIR $INSTALLROOT/bin
}


