package: CLHEP
version: "2.4.0.1"
tag: CLHEP_2_4_0_1
source: https://gitlab.cern.ch/CLHEP/CLHEP
build_requires:
  - CMake
---
#!/bin/sh
cmake $SOURCEDIR \
  -DCMAKE_INSTALL_PREFIX:PATH="$INSTALLROOT"

make ${JOBS+-j $JOBS}
make install

# Modulefile
MODULEDIR="$INSTALLROOT/etc/modulefiles"
MODULEFILE="$MODULEDIR/$PKGNAME"
mkdir -p "$MODULEDIR"

alibuild-generate-module --bin --lib > $MODULEFILE

cat >> "$MODULEFILE" <<EoF
prepend-path ROOT_INCLUDE_PATH \$PKG_ROOT/include
EoF
