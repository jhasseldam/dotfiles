{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Common
    wget curl htop tmux gparted manpages xclip
    # Internet
    firefox chromium hexchat irssi socat
    # Gnome 3
    gnome3.gnome_keyring
    gthumb vlc
  ];
}
