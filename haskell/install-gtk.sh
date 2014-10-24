#!/bin/bash

echo "+=========================================================+"
echo "| PREREQUISITES                                           |"
echo "+=========================================================+"

sudo apt-get install -y libglib2.0-dev libcairo2-dev libpango1.0-dev libgtk2.0-dev glade-gtk2 gconf2 libgconf2-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libgtkglext1-dev libgtksourceview2.0-dev librsvg2-dev libvte-dev libwebkit-dev glade-gtk2
if [ $? -gt 0 ]; then
  echo "Cannot install prerequisites for GTK"
  exit -1
fi
echo "Done."

echo "+=========================================================+"
echo "| DOWNGRADE TO CABAL v1.16.0.2                            |"
echo "+=========================================================+"

. "$HOME/.profile"
cabal update
cabal install cabal-install-1.16.0.2
. "$HOME/.profile"
echo "Done."

echo "+=========================================================+"
echo "| GTK PACKAGES                                            |"
echo "+=========================================================+"

cabal update
cabal install gtk2hs-buildtools
. "$HOME/.profile"
cabal install glib
cabal install gio
cabal install cairo
cabal install pango
cabal install gtk

echo "+=========================================================+"
echo "| GTK ADDITIONAL PACKAGES                                 |"
echo "+=========================================================+"

cabal install glade
cabal install gconf
cabal install gstreamer
cabal install gtkglext
cabal install gtksourceview2
cabal install soegtk
cabal install svgcairo
cabal install vte
cabal install webkit

echo "+=========================================================+"
echo "| UPGRADE TO LATEST CABAL                                 |"
echo "+=========================================================+"

cabal update
cabal install cabal-install
. "$HOME/.profile"
echo "Done."
