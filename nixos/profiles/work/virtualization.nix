{ config, pkgs, ... }:

{
  virtualisation = {
    docker = {
      enable = true;
      liveRestore = false;
      extraOptions = ''
-H unix:///var/run/docker.sock -H tcp://0.0.0.0:2375 --insecure-registry docker-hub:5000 --insecure-registry docker-hub:5043
      '';
    };
    virtualbox = {
      host.enable = false;
      guest.enable = true;
    };
  };

  nixpkgs.config.virtualbox.enableExtensionPack = true;
}
