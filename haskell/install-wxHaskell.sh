#!/bin/bash

echo "+=========================================================+"
echo "| PREREQUISITES                                           |"
echo "+=========================================================+"

sudo apt-get install -y build-essential g++ libglu1-mesa-dev wx2.8-headers libwxgtk2.8-0 libwxgtk2.8-dev wx2.8-doc
if [ $? -gt 0 ]; then
  echo "Cannot install prerequisites for wxHaskell"
  exit -1
fi
cd /usr/include
sudo ln -sv wx-2.8/wx wx
echo "Done."

echo "+=========================================================+"
echo "| WX PACKAGES                                             |"
echo "+=========================================================+"

cabal update
cabal install wx-0.13.2.3

echo "+=========================================================+"
echo "| WX FORM BUILDER                                         |"
echo "+=========================================================+"

sudo apt-get install wxformbuilder
