{ config, pkgs, lib, ... }:

let
  global = (import ./global.nix);
in
  {
    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.extraUsers = lib.singleton {
      name = global.userName;
      isNormalUser = true;
      home = "/home/${global.userName}";
      description = "${global.userDescription}";
      extraGroups = [ "wheel" "networkmanager" "docker" "vboxusers" ];
      initialPassword = "${global.userInitialPassword}";
      # shell = "/run/current-system/sw/bin/zsh";
    };
  }
