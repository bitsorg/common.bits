package: rust
version: "%(tag_basename)s"
tag: "1.88.0"
source: https://github.com/rust-lang/rust.git
requires:
  - "GCC-Toolchain:(?!osx)"

build_requires:
  - CMake
  - Clang
  - bits-recipe-tools
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Prepare() {
    case $ARCHITECTURE in
	ubuntu2404_x86-64)
	    arch="x86_64-unknown-linux-gnu"
         ;;   
	*)
	    echo "rust: incompatible architecture: $ARCHITECTURE"
	    exit 1
	    ;;
    esac
    curl https://lcgpackages.web.cern.ch/tarFiles/sources/$PKGNAME-$PKGVERSION-$arch.tar.gz | tar zxf -
    builddir=$PKGNAME-$PKGVERSION-$arch
}

function Configure() {
  true
}

function Make() {
  true
}

function MakeInstall() {
  cd $builddir  
  ./install.sh  --prefix=$INSTALLROOT --verbose
}


