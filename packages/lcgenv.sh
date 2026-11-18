package: lcgenv
version: "%(tag_basename)s"
tag: "v1.3.22"
source: https://gitlab.cern.ch/GENSER/lcgenv.git
requires:
  - "GCC-Toolchain:(?!osx)"
  - Python-modules-list
  
build_requires:
  - bits-recipe-tools
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin"
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


