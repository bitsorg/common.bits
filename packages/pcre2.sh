package: PCRE2
version: "%(tag_basename)s"
tag: "pcre2-10.42"
source: https://github.com/PCRE2Project/pcre2.git
requires:
  - "GCC-Toolchain:(?!osx)"
  - CMake
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
##############################
function Configure() {
    ./autogen.sh
    ./configure --prefix=$INSTALLROOT
}

