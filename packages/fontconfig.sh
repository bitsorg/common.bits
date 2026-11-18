package: fontconfig
version: "2.13.1"
tag: 2.13.1
source: https://github.com/fontconfig/fontconfig.git
requires:
  - "GCC-Toolchain:(?!osx)"
build_requires:
  - CMake
  - bits-recipe-tools
  - gperf
  - expat
  - UUID
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
  ./autogen.sh
  ./configure --disable-docs --prefix=$INSTALLROOT 
}
