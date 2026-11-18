package: libxslt
version: "%(tag_basename)s"
tag: "v1.1.43"
source: https://gitlab.gnome.org/GNOME/libxslt.git
build_requires:
  - "autotools:(slc6|slc7)"
  - zlib
  - "GCC-Toolchain:(?!osx)"
  - bits-recipe-tools
prefer_system: "(?!slc5)"
prefer_system_check:
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  rsync -a $SOURCEDIR/ ./
  autoreconf -i
  ./configure --disable-static \
              --prefix=$INSTALLROOT \
              --with-zlib="${ZLIB_ROOT}" --without-python
}
