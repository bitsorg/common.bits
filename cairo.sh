package: cairo
version: "%(tag_basename)s"
tag: 1.18.4
source: https://anongit.freedesktop.org/git/cairo.git
requires:
  - "GCC-Toolchain:(?!osx)"
build_requires:
  - bits-recipe-tools
  - pixman
  - FreeType
  - fontconfig
prefer_system: (?!slc5)
  - meson
  - ninja
prefer_system_check:
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Prepare() {
    rsync -av --delete --delete-excluded $SOURCEDIR/ ./
}
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

