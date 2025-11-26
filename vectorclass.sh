package: vectorclass
version: "%(tag_basename)s" 
tag: "v2.02.01"
source: https://github.com/vectorclass/version2
requires:
  - "GCC-Toolchain:(?!osx)"
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
    cp -r $SOURCEDIR $INSTALLROOT
}
