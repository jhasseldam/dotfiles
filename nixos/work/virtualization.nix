{ config, pkgs, ... }:

{
  virtualisation = {
    docker = {
      enable = true;
      socketActivation = true;
    };
    virtualbox = {
      host.enable = false;
      guest.enable = true;
    };
  };
  nixpkgs.config.virtualbox.enableExtensionPack = true;
}
