{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    python35Packages.docker_compose
  ];

  virtualisation = {
    docker = {
      enable = true;
      socketActivation = true;
      extraOptions = ''
--insecure-registry docker-hub:5000 --insecure-registry docker-hub:5043
      '';
    };
    virtualbox = {
      host.enable = false;
      guest.enable = true;
    };
  };

  nixpkgs.config.virtualbox.enableExtensionPack = true;
}
