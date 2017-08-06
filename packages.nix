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
    # Internet
    chromium chatzilla irssi slack dropbox qbittorrent putty
    # Office
    octaveFull graphviz # texlive.combined.scheme-full
    evince poppler_utils
    # Multimedia
    vlc exif ffmpeg gphoto2 youtube-dl
  ];
}
