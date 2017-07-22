{ config, pkgs, ... }:

{
  virtualisation = {
    docker = {
      enable = true;
      liveRestore = false;
      logDriver = "json-file";
      extraOptions = ''
-H unix:///var/run/docker.sock -H tcp://0.0.0.0:2375 --log-opt max-size=1M --log-opt max-file=1
      '';
    };
    virtualbox = {
      host.enable = true;
      guest.enable = false;
    };
  };

  nixpkgs.config.virtualbox.enableExtensionPack = false;
}
