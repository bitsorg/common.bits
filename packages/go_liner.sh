package: go_liner
version: "%(tag_basename)s"
tag: "v1.2.2"
source: https://github.com/peterh/liner.git
requires:
  - "GCC-Toolchain:(?!osx)"
build_requires:
  - bits-recipe-tools
  - golang
  - go_runewidth
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
    mkdir -p $INSTALLROOT/src/github.com/peterh/liner
}
function Make() {
   cp -r $SOURCEDIR/* $INSTALLROOT/src/github.com/peterh/liner
}
function MakeInstall() {
  cd $INSTALLROOT/src/github.com/peterh/liner && go install
}
