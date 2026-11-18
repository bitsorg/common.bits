package: go_runewidth
version: "%(tag_basename)s"
tag: "v0.0.16"
source: https://github.com/mattn/go-runewidth
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
    mkdir -p $INSTALLROOT/src/github.com/mattn/go-runewidth
}
function Make() {
   cp -r $SOURCEDIR/* $INSTALLROOT/src/github.com/mattn/go-runewidth
}
function MakeInstall() {
  cd $INSTALLROOT/src/github.com/mattn/go-runewidth && go install
}
