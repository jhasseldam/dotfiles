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
    chromium firefox chatzilla irssi slack dropbox qbittorrent putty
    # Office
    wpsoffice octaveFull graphviz texlive.combined.scheme-full gnuplot
    evince poppler_utils
    # Multimedia
    vlc exif ffmpeg gphoto2 youtube-dl
  ];
}
