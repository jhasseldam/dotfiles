{ config, pkgs, ... }:

let
  unstable = (import (fetchTarball https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz) {
    inherit (config.nixpkgs) config system;
  }).pkgs;
in
{
  environment.systemPackages = with pkgs; [
    # Common
    wget curl htop gksu inetutils
    zip unzip dbus dbus_daemon xclip
    # Internet
    chromium slack
    # Office
    libreoffice # texlive.combined.scheme-full
    evince poppler_utils taskwarrior vit
    # Stuff
    cmatrix xscreensaver
    # File systems
    ntfs3g exfat
    # Security
    unstable.veracrypt keepass
    # Data
    octaveFull graphviz gnuplot
  ];
}
