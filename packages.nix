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
    xclip
    # Internet
    chromium firefox hexchat irssi slack dropbox qbittorrent putty
    # Office
    libreoffice octaveFull graphviz texlive.combined.scheme-full gnuplot
    evince poppler_utils taskwarrior vit
    # Multimedia
    vlc exif ffmpeg gphoto2 youtube-dl
    # Stuff
    cmatrix xscreensaver
    # File systems
    exfat
  ];
}
