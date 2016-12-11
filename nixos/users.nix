{ config, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.kuznero = {
    isNormalUser = true;
    home = "/home/kuznero";
    description = "Roman Kuznetsov";
    extraGroups = [ "wheel" "networkmanager" "docker" ];
    initialPassword = "kuznero";
    # shell = "/run/current-system/sw/bin/zsh";
  };
}
