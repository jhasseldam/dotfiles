{ config, pkgs, ... }:

{
  virtualisation = {
    docker = {
      enable = true;
      liveRestore = false;
      logDriver = "json-file";
      extraOptions = ''
-H unix:///var/run/docker.sock -H tcp://0.0.0.0:2375 --insecure-registry db-docker-fxcore.artifactory.danskenet.net --log-opt max-size=1M --log-opt max-file=1
      '';
    };
    virtualbox = {
      host.enable = false;
      guest.enable = true;
    };
  };

  nixpkgs.config.virtualbox.enableExtensionPack = true;
}
