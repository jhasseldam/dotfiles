{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    python35Packages.docker_compose
  ];

  virtualisation = {
    docker = {
      enable = true;
      liveRestore = false;
      extraOptions = ''
-H unix:///var/run/docker.sock -H tcp://0.0.0.0:2375
      '';
    };
    virtualbox = {
      host.enable = true;
      guest.enable = false;
    };
  };

  nixpkgs.config.virtualbox.enableExtensionPack = false;
}
