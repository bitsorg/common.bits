package: yamlcpp
version: "%(tag_basename)s"
tag: "0.8.0"
source: https://github.com/jbeder/yaml-cpp
requires:
  - boost
build_requires:
  - CMake
  - bits-recipe-tools
  
prefer_system: (?!slc5)
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --inc --root"
##############################
function Prepare() {
  rsync -av --delete --delete-excluded $SOURCEDIR/ ./
}
function Configure() {
  case $ARCHITECTURE in
    osx*) [[ $BOOST_ROOT ]] || BOOST_ROOT=`brew --prefix boost` ;;
    *) ;;
  esac
  cmake .  -DCMAKE_INSTALL_PREFIX:PATH="$INSTALLROOT"  \
                    -DBUILD_SHARED_LIBS=YES                                \
                    ${BOOST_ROOT:+-DBOOST_ROOT:PATH="$BOOST_ROOT"}         \
                    ${BOOST_ROOT:+-DBoost_DIR:PATH="$BOOST_ROOT"}          \
                    ${BOOST_ROOT:+-DBoost_INCLUDE_DIR:PATH="$BOOST_ROOT/include"}  \
                    -DCMAKE_SKIP_RPATH=YES                                 \
                    -DYAML_CPP_BUILD_TESTS=NO                              \
                    -DSKIP_INSTALL_FILES=0
}

function Make() {
     cmake --build  . -- ${CMAKE_OPTIONS} ${JOBS:+-j$JOBS}
}

function MakeInstall() {
      cmake --install .
}

function PostInstall() {
  echo "set YAMLCPP_INCLUDE_DIR \$PKG_ROOT" >> $MODULEFILE
}
