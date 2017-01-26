{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Common
    wget curl bind htop gksu ntfs3g inetutils
    enlightenment.terminology zip unzip
    # Internet
    chromium hexchat dropbox qbittorrent
    # Office
    evince poppler_utils
    # Multimedia
    vlc
  ];
}
