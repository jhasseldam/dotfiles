{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Terminal emulators
    enlightenment.terminology
    # Security
    truecrypt
    # Common
    wget curl bind htop gksu ntfs3g inetutils
    zip unzip gparted
    dbus dbus_daemon
    # Devices
    bluez bluez-tools blueman
    # Internet
    vivaldi firefox chatzilla slack putty
    # Office
    octaveFull graphviz # texlive.combined.scheme-full
    evince poppler_utils keepass
  ];
}
