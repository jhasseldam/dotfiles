{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Common
    wget curl bind htop gksu ntfs3g inetutils
    zip unzip gparted
    dbus dbus_daemon
    # Devices
    bluez bluez-tools blueman
    # Internet
    vivaldi firefox chatzilla putty
    # Office
    octaveFull graphviz # texlive.combined.scheme-full
    evince poppler_utils keepass
    # Multimedia
    vlc ffmpeg youtube-dl
  ];
}
