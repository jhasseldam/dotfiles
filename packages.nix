{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Security
    truecrypt
    # terminal emulators
    terminology
    # Common
    wget curl bind htop gksu ntfs3g inetutils
    zip unzip gparted
    dbus dbus_daemon
    # Devices
    bluez bluez-tools blueman
    # Internet
    vivaldi firefox chatzilla irssi slack dropbox qbittorrent putty
    # Office
    octaveFull graphviz texlive.combined.scheme-full
    evince poppler_utils
    # Multimedia
    vlc exif ffmpeg gphoto2 youtube-dl
  ];
}
