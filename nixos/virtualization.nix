{ config, pkgs, ... }:

{
  virtualisation = {
    docker = {
      enable = true;
      socketActivation = true;
    };
    virtualbox = {
      host.enable = true;
      guest.enable = false;
    };
  };
}
