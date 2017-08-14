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
    wpsoffice evince keepass
  ];
}
