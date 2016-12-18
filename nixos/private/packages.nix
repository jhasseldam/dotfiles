{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Common
    wget curl htop gparted manpages xclip
    # Internet
    firefox chromium hexchat irssi tdesktop
    xe-guest-utilities dropbox qbittorrent
    # Office
    evince
    # Gnome 3
    gnome3.gnome_keyring
    gthumb vlc
  ];
}
