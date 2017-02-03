{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Common
    gnome-terminal
    wget curl bind htop gksu ntfs3g inetutils
    zip unzip
    # Internet
    chromium hexchat dropbox qbittorrent
    # Office
    evince poppler_utils
    # Multimedia
    vlc exif ffmpeg
  ];
}
