#!/usr/bin/env bash

# determine absolute path of the current script
ROOT="`dirname \"$0\"`" # relative
ROOT="`( cd \"$ROOT\" && pwd )`" # absolutized and normalized
if [ -z "$ROOT" ] ; then
  # error; for some reason, the path is not accessible
  # to the script (e.g. permissions re-evaled after suid)
  exit 1 # fail
fi

RED='\033[1;31m'
GREEN='\033[1;32m'
NC='\033[0m'

echo ""
echo -e "${RED}## ${GREEN}Proxy configuration${NC}"
echo ""
echo -n -e "${GREEN}Domain:${NC}   "
read domain
echo -n -e "${GREEN}Username:${NC} "
read user
echo -n -e "${GREEN}Password:${NC} "
read -s password
echo ""

sed -i "s/\"user\"/\"$user\"/" "$ROOT/networking.nix"
sed -i "s/\"password\"/\"$password\"/" "$ROOT/networking.nix"
sed -i "s/\"domain\"/\"$domain\"/" "$ROOT/networking.nix"
