#!/bin/bash

echo "+=========================================================+"
echo "| PREREQUISITES                                           |"
echo "+=========================================================+"

sudo dpkg -i libgmp3c2_4.3.2+dfsg-1_amd64.deb
sudo apt-get install -y wget build-essential
echo "Done."

pushd .

tmp=$(mktemp -d)

echo
echo "+=========================================================+"
echo "| SETUP PATH                                              |"
echo "+=========================================================+"

echo '
if [ -d "$HOME/bin/ghc/bin" ] ; then
  PATH="$HOME/bin/ghc/bin:$PATH"
fi

if [ -d "$HOME/bin/haskell-platform/bin" ] ; then
  PATH="$HOME/bin/haskell-platform/bin:$PATH"
fi

if [ -d "$HOME/.cabal/bin" ] ; then
  PATH="$HOME/.cabal/bin:$PATH"
fi
' >> "$HOME/.profile"
echo "Done."

echo
echo "+=========================================================+"
echo "| GHC v7.6.3                                              |"
echo "+=========================================================+"

cd ${tmp}

wget http://www.haskell.org/ghc/dist/7.6.3/ghc-7.6.3-x86_64-unknown-linux.tar.bz2
if [ $? -gt 0 ]; then
  echo "Cannot download Ghc v7.6.3"
  popd
  exit -1
fi
tar -xjf ghc-7.6.3-x86_64-unknown-linux.tar.bz2
cd ghc-7.6.3/
./configure --prefix="$HOME/bin/ghc"
if [ $? -gt 0 ]; then
  echo "Cannot configure Ghc v7.6.3"
  popd
  exit -1
fi
make install
if [ $? -gt 0 ]; then
  echo "Cannot install Ghc v7.6.3"
  popd
  exit -1
fi
. "$HOME/.profile"
ghc-pkg check # should produce no warnings whatsoevery
echo "Done."

echo
echo "+=========================================================+"
echo "| HASKELL PLATFORM v2013.2.0.0                            |"
echo "+=========================================================+"

cd ${tmp}

sudo apt-get install -y hscolour libgmp-dev zlib1g-dev freeglut3-dev

wget http://lambda.haskell.org/platform/download/2013.2.0.0/haskell-platform-2013.2.0.0.tar.gz
if [ $? -gt 0 ]; then
  echo "Cannot download Haskell Platform v2013.2.0.0"
  popd
  exit -1
fi
tar -xzf haskell-platform-2013.2.0.0.tar.gz 
cd haskell-platform-2013.2.0.0/
./configure --prefix="$HOME/bin/haskell-platform"
if [ $? -gt 0 ]; then
  echo "Cannot configure Haskell Platform v2013.2.0.0"
  popd
  exit -1
fi
make
if [ $? -gt 0 ]; then
  echo "Cannot make Haskell Platform v2013.2.0.0"
  popd
  exit -1
fi
make install
if [ $? -gt 0 ]; then
  echo "Cannot install Haskell Platform v2013.2.0.0"
  popd
  exit -1
fi
. "$HOME/.profile"
ghc-pkg check # should produce just a few warnings
# get rid off ghc warnings:
mkdir -p "$HOME/bin/haskell-platform/share/doc/haskell-platform-2013.2.0.0/html"
touch "$HOME/bin/haskell-platform/share/doc/haskell-platform-2013.2.0.0/html/haskell-platform.haddock"
echo "Done."

echo
echo "+=========================================================+"
echo "| UPDATE CABAL                                            |"
echo "+=========================================================+"

cd ${tmp}

cabal update
# change ~/.cabal/config to have "documentation: True"
echo '
documentation: True
' >> "$HOME/.cabal/config"
cabal install cabal-install
. "$HOME/.profile"
# cabal install hoogle
# hoogle data
echo "Done."

popd

echo
echo "+=========================================================+"
echo "| CLEANUP                                                 |"
echo "+=========================================================+"

rm -rf ${tmp}

echo "Done."
