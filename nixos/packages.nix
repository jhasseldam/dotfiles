{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Security
    truecrypt
    # Common
    wget curl bind htop gksu ntfs3g inetutils
    zip unzip gparted
    # Internet
    firefox hexchat irssi dropbox qbittorrent
    # Office
    octaveFull graphviz texlive.combined.scheme-full
    evince poppler_utils
    # Multimedia
    vlc exif ffmpeg gphoto2
    # Common devel
    gnumake diffuse meld
    redis-desktop-manager
    pgadmin
  ];
}
