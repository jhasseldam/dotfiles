{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Common
    wget curl htop inetutils zip unzip
    dbus dbus_daemon
    # Internet
    chromium slack
    # Office
    evince keepass
  ];
}
