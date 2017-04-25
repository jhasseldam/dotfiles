#!/usr/bin/env bash

if [[ "$#" -ne 1 ]]; then
  echo Expected argument is missing: MODE
  exit 1
fi

MODE=$1
TARGET=/etc/nixos

# determine absolute path of the current script
ROOT="`dirname \"$0\"`" # relative
ROOT="`( cd \"$ROOT\" && pwd )`" # absolutized and normalized
if [ -z "$ROOT" ] ; then
  # error; for some reason, the path is not accessible
  # to the script (e.g. permissions re-evaled after suid)
  exit 1 # fail
fi

if [[ ! -d "$ROOT/profiles/$MODE/" ]]; then
  echo Supplied mode does not exist
  exit 1
fi

rsync -rav --delete --exclude "hardware-configuration.nix" "$ROOT/" "$TARGET/"
exit_code=$?
if [ $exit_code -ne 0 ]; then
  echo "ERROR: cannot synchronize configuration files"
  exit $exit_code
fi

pushd .
cd "$TARGET/profiles/$MODE/"
for f in *.nix; do
  echo "$MODE/$f -> $f ..."
  if [[ -f $TARGET/$f ]]; then rm $TARGET/$f; fi
  ln -s profiles/$MODE/$f $TARGET/$f
done
if [[ -f "$TARGET/profiles/$MODE/post-install.sh" ]]; then
  $TARGET/profiles/$MODE/post-install.sh
fi
popd
