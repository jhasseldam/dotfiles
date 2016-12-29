{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Common
    wget curl bind htop
    # Internet
    firefox irssi dropbox elinks
    # Office
    evince
    # Gnome 3
    gnome3.gnome_keyring
  ];
}
