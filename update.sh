#!/usr/bin/env bash

command -v find >/dev/null 2>&1 || { echo >&2 "[find] is required, but not installed.  Aborting."; exit 1; }
command -v rsync >/dev/null 2>&1 || { echo >&2 "[rsync] is required, but not installed.  Aborting."; exit 1; }

if [[ "$#" -ne 1 ]]; then
  echo Expected argument is missing: MODE
  exit 1
fi

ROOT="$(dirname "$(readlink -f "$0")")"
"$ROOT/_install.sh" $1 /etc/nixos
