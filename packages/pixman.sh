package: pixman
version: "%(tag_basename)s"
tag: pixman-0.46.2
source: https://gitlab.freedesktop.org/pixman/pixman.git
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
    mkdir build 
    meson setup build --prefix=$INSTALLROOT 
}
function Make() {
    ninja -C build 
}
function MakeInstall() {
    ninja -C build install
}
