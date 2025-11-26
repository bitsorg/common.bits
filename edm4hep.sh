package: EDM4hep
version: "%(tag_basename)s"
tag: "v00-99-01"
source: https://github.com/key4hep/EDM4hep.git
requires:
  - "GCC-Toolchain:(?!osx)"
  - ROOT
  - PODIO
  
build_requires:
  - CMake
  - alibuild-recipe-tools
---
#!/bin/bash -e
function Configure() {
   cmake $SOURCEDIR            \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=$INSTALLROOT        \
      -DROOT_DIR=$ROOTSYS
}
  
 


