{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Security
    truecrypt
    # Common
    wget curl bind htop gksu ntfs3g inetutils
    zip unzip gparted
    # Internet
    chromium hexchat dropbox qbittorrent
    tdesktop
    # Office
    evince poppler_utils
    # Multimedia
    vlc exif ffmpeg gphoto2
  ];
}
