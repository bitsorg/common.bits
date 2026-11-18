package: go_readline
version: "%(tag_basename)s"
tag: "v1.5.1"
source: https://github.com/chzyer/readline.git
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
    mkdir -p $INSTALLROOT/src/github.com/chzyer/readline
}
function Make() {
    cp -r $SOURCEDIR/* $INSTALLROOT/src/github.com/chzyer/readline
}
function MakeInstall() {
  cd $INSTALLROOT/src/github.com/chzyer/readline && go install
}
