package: HepPDT
version: "%(tag_basename)s"
tag: "v3.04.01"
source: https://github.com/NICAdist/HepPDT.git
requires:
  - "GCC-Toolchain:(?!osx)"
  
build_requires:
  - bits-recipe-tools
  
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  sed  -i 's/\.\/buildDoc.sh/true/' bootstrap 
  ./bootstrap
  ./configure --prefix=$INSTALLROOT --without-doc
}
