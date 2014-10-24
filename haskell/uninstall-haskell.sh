#!/bin/bash

echo "+=========================================================+"
echo "| REMOVE GHC                                              |"
echo "+=========================================================+"

rm -rvf "$HOME/bin/ghc"
rm -rvf "$HOME/.ghc/"
echo "Done."

echo
echo "+=========================================================+"
echo "| REMOVE HASKELL PLATFORM                                 |"
echo "+=========================================================+"

rm -rvf "$HOME/bin/haskell-platform"
rm -rvf "$HOME/.cabal/"
echo "Done."
