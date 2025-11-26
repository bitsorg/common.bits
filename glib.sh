package: glib
version: "%(tag_basename)s"
tag: "2.72.3"
source: https://github.com/GNOME/glib.git
requires:
  - "GCC-Toolchain:(?!osx)"
  - CMake
  - PCRE2
build_requires:
  - bits-recipe-tools
  - Python-modules
  
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
     meson setup build --prefix=$INSTALLROOT -Dlibmount=disabled -Dtests=false
 }

function Make() {
     meson compile -C build
}

function MakeInstall() {
     meson install -C build
}
