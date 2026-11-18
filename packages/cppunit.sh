package: CppUnit
version: "%(tag_basename)s" 
tag: cppunit-1.14.0
source: http://anongit.freedesktop.org/git/libreoffice/cppunit.git
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
##############################
function Configure() {
    ./autogen.sh
    ./configure --prefix=$INSTALLROOT  --disable-doxygen   
}
