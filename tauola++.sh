package: tauola++
version: "%(tag_basename)s"
tag: "v1.1.5"
source: https://github.com/Azralee/Tauolapp.git
requires:
  - "GCC-Toolchain:(?!osx)"
  - HepMC
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
    ./configure --without-hepmc3 -with-hepmc=$HEPMC_ROOT --with-pic --with-tau-spinne --prefix=$INSTALLROOT
}
