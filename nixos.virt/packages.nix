{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    # Common
    wget curl htop tmux gparted manpages
    # Internet
    firefox chromium hexchat irssi tdesktop
    # Programming
    stack texlive.combined.scheme-full
    # Gnome 3
    gnome3.gnome_keyring
    gthumb vlc
  ];
}
