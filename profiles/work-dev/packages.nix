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
    libreoffice evince poppler_utils taskwarrior vit keepass
    texlive.combined.scheme-full
    # Stuff
    cmatrix xscreensaver
    # Security
    # veracrypt
  ];
}
