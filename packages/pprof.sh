package: pprof
version: "%(tag_basename)s"
tag: "main"
source: https://github.com/google/pprof.git
requires:
  - "GCC-Toolchain:(?!osx)"
build_requires:
  - bits-recipe-tools
  - golang
  - go_readline
  - go_demangle
  - graphviz
  
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
    mkdir -p $INSTALLROOT/src/github.com/google/pprof
}
function Make() {
    cp -r $SOURCEDIR/* $INSTALLROOT/src/github.com/google/pprof
}
function MakeInstall() {
  cd $INSTALLROOT/src/github.com/google/pprof && go install
}
