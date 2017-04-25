#!/usr/bin/env bash

# determine absolute path of the current script
ROOT="`dirname \"$0\"`" # relative
ROOT="`( cd \"$ROOT\" && pwd )`" # absolutized and normalized
if [ -z "$ROOT" ] ; then
  # error; for some reason, the path is not accessible
  # to the script (e.g. permissions re-evaled after suid)
  exit 1 # fail
fi

echo ""
echo "## Proxy configuration"
echo -n "Domain: "
read domain
echo -n "Username: "
read user
echo -n "Password: "
read -s password
echo ""

sed -i "s/\"user\"/\"$user\"/" "$ROOT/networking.nix"
sed -i "s/\"password\"/\"$password\"/" "$ROOT/networking.nix"
sed -i "s/\"domain\"/\"$domain\"/" "$ROOT/networking.nix"
