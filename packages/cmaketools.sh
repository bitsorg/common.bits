package: cmaketools
version: "%(tag_basename)s" 
tag: "1.9"
source: https://github.com/HSF/cmaketools.git
requires:
  - CMake
build_requires:
  - bits-recipe-tools
prefer_system: (?!slc5)
prefer_system_check:
---
#!/bin/bash -e
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
true
}

function Make() {
true
}

function MakeInstall() {
    mkdir -p $INSTALLROOT/share/CMakeTools 
    cp -dr $SOURCEDIR $INSTALLROOT/share/CMakeTools
}
