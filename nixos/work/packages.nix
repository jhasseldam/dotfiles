{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Common
    wget curl bind htop gparted manpages xclip
    # Internet
    firefox chromium
    xe-guest-utilities
    # Office
    evince
    # Gnome 3
    gnome3.gnome_keyring
  ];
}
