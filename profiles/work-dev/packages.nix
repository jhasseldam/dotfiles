{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Terminal emulators
    enlightenment.terminology
    # Common
    wget curl htop inetutils zip unzip
    dbus dbus_daemon
    # Internet
    chromium slack
    # Office
    libreoffice octaveFull graphviz texlive.combined.scheme-full gnuplot
    evince poppler_utils
    keepass
  ];
}
