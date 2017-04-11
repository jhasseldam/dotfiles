#!/usr/bin/env bash

command -v readlink >/dev/null 2>&1 || { echo >&2 "[readlink] is required, but not installed.  Aborting."; exit 1; }
command -v find >/dev/null 2>&1 || { echo >&2 "[find] is required, but not installed.  Aborting."; exit 1; }

root="$(cd "$(dirname "$(readlink -f "$0")")" && pwd)/themes"

function install_themes() {
  while read p; do
    filename=$(basename "$p")
    echo Applying theme [$filename]
    bash -c "source $p"
  done
}

find $root -type f -name '*.sh' -print | install_themes
