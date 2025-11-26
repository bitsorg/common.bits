package: abseil
version: "%(tag_basename)s"
tag: "20240722.0"
source: https://github.com/abseil/abseil-cpp
requires:
  - "GCC-Toolchain:(?!osx)"
build_requires:
  - CMake
  - ninja
  - bits-recipe-tools
prefer_system: "osx"
prefer_system_check: |
  printf '#include <absl/container/flat_hash_map.h>' | c++ -std=c++20 -I"$(brew --prefix abseil)/include" -c -xc++ - >/dev/null
incremental_recipe: |
  cmake --build . -- ${JOBS:+-j$JOBS} install
  mkdir -p $INSTALLROOT/etc/modulefiles && rsync -a --delete etc/modulefiles/ $INSTALLROOT/etc/modulefiles
prepend_path:
  PKG_CONFIG_PATH: "$ABSEIL_ROOT/lib/pkgconfig"
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --cmake"
##############################
