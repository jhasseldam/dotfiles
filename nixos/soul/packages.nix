{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Common
    wget curl bind htop
    # Internet
    firefox irssi dropbox
    # Office
    evince
    # Gnome 3
    gnome3.gnome_keyring
  ];
}
