{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Common
    wget curl htop inetutils zip unzip
    dbus dbus_daemon
    # Office
    evince keepass
  ];
}
