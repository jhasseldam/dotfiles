{ config, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.user = {
    isNormalUser = true;
    home = "/home/user";
    description = "Default User";
    extraGroups = [ "wheel" "networkmanager" "docker" "vboxusers" ];
    initialPassword = "user";
    # shell = "/run/current-system/sw/bin/zsh";
  };
}
