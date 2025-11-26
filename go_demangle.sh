package: go_demangle
version: "%(tag_basename)s"
tag: "master"
source: https://github.com/ianlancetaylor/demangle.git
requires:
  - "GCC-Toolchain:(?!osx)"
build_requires:
  - bits-recipe-tools
  - golang
prefer_system: (?!slc5)
prefer_system_check:
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
    mkdir -p $INSTALLROOT/bin
    mkdir -p $INSTALLROOT/pkg
    mkdir -p $INSTALLROOT/src/github.com/ianlancetaylor/demangle
}
function Make() {
   cp -r $SOURCEDIR/* $INSTALLROOT/src/github.com/ianlancetaylor/demangle
}
function MakeInstall() {
  cd $INSTALLROOT/src/github.com/ianlancetaylor/demangle && go install
}
