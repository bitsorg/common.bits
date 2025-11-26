package: umesimd
version: "%(tag_basename)s"
tag: "v0.8.1"
source: https://github.com/edanor/umesimd.git
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
    :;
}

function Make() {
    :;
}

function MakeInstall() {
    mkdir -p $INSTALLROOT/include/umesimd
    cp -r $SOURCEDIR $INSTALLROOT/include/umesimd
}


