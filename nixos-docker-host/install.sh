#!/usr/bin/env bash

TARGET=/etc/nixos

# determine absolute path of the current script
ROOT="`dirname \"$0\"`" # relative
ROOT="`( cd \"$ROOT\" && pwd )`" # absolutized and normalized
if [ -z "$ROOT" ] ; then
  # error; for some reason, the path is not accessible
  # to the script (e.g. permissions re-evaled after suid)
  exit 1 # fail
fi

rsync -rav --delete --exclude "hardware-configuration.nix" "$ROOT/" "$TARGET/"
exit_code=$?
if [ $exit_code -ne 0 ]; then
  echo "ERROR: cannot synchronize configuration files"
  exit $exit_code
fi
