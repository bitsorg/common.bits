package: FeynHiggs
version: "%(tag_basename)s" 
tag: "2.16.1"
source: https://github.com/hep-packaging-coordination/feynhiggs-release-mirror.git
requires:
  - "GCC-Toolchain:(?!osx)"
build_requires:
  - bits-recipe-tools
prefer_system: (?!slc5)
prefer_system_check:
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
CMAKE_OPTIONS="${IGNORE_ERRORS:+-k}"
##############################
function Configure() {
    ./configure --prefix=$INSTALLROOT
}
