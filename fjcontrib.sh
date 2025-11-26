package: fjcontrib
version: "%(tag_basename)s" 
tag: "1.101"
source: https://github.com/fjcontrib/fjcontrib.git
requires:
  - "GCC-Toolchain:(?!osx)"
  - fastjet
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
