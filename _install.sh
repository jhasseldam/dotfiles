#!/usr/bin/env bash

command -v find >/dev/null 2>&1 || { echo >&2 "[find] is required, but not installed.  Aborting."; exit 1; }
command -v rsync >/dev/null 2>&1 || { echo >&2 "[rsync] is required, but not installed.  Aborting."; exit 1; }

if [[ "$#" -ne 2 ]]; then
  echo Expected argument is missing: MODE TARGET_PATH
  exit 1
fi

MODE=$1
TARGET=$2

RED='\033[1;31m'
GREEN='\033[1;32m'
NC='\033[0m'

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

pushd () {
  command pushd "$@" > /dev/null
}

popd () {
  command popd "$@" > /dev/null
}

rsync -rav --delete --exclude "hardware-configuration.nix" --exclude ".git/" "$ROOT/" "$TARGET/"
exit_code=$?
if [ $exit_code -ne 0 ]; then
  echo "ERROR: cannot synchronize configuration files"
  exit $exit_code
fi

echo ""
echo -e "${RED}## ${GREEN}Switching in ${RED}$MODE${GREEN} profile${NC}"
echo ""
pushd .
cd "$TARGET/profiles/$MODE/"
if [[ -f "$TARGET/profiles/$MODE/post-install.sh" ]]; then
  $TARGET/profiles/$MODE/post-install.sh
fi

echo ""
for dir in $(find . -iname "*.nix" -print); do
  echo -e "${RED} * ${NC}$MODE${dir:1}$f ${RED}->${NC} ${dir:2}$f ..."
  if [[ -f $TARGET/${dir:1}$f ]]; then rm $TARGET/${dir:1}$f; fi
  if [[ $TARGET == /mnt* ]]; then
    cp $TARGET/profiles/$MODE${dir:1}$f $TARGET/${dir:1}$f
  else
    ln -s $TARGET/profiles/$MODE${dir:1}$f $TARGET/${dir:1}$f
  fi
done
popd
echo ""
