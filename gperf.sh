package: gperf
version: "%(tag_basename)s"
tag: "v3.1"
source: https://github.com/bitslcg/gperf.git
requires:
  - "GCC-Toolchain:(?!osx)"
build_requires:
  - bits-recipe-tools
prefer_system: (?!slc5)
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
