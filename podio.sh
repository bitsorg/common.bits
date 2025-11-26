package: PODIO
version: "%(tag_basename)s"
tag: "v01-02"
source: https://github.com/AIDASoft/podio
requires:
  - "GCC-Toolchain:(?!osx)"
  - ROOT
  
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
  
 


