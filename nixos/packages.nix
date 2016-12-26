{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Common
    wget curl bind htop gparted manpages xclip
    # Internet
    firefox chromium hexchat irssi tdesktop
    xe-guest-utilities dropbox qbittorrent
    # Office
    evince libreoffice poppler_utils
    # Multimedia
    gthumb vlc gimp-with-plugins
    # Gnome 3
    gnome3.gnome_keyring
  ];
}
