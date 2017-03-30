{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    python35Packages.docker_compose
  ];

  virtualisation = {
    docker = {
      enable = true;
    };
    virtualbox = {
      host.enable = true;
      guest.enable = false;
    };
  };

  nixpkgs.config.virtualbox.enableExtensionPack = false;
}
