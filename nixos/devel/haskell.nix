{ config, pkgs, ... }:

let
  unstable = (import (fetchTarball https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz) {
    inherit (config.nixpkgs) config system;
  }).pkgs;
in
{
  environment.systemPackages = with pkgs; [
    unstable.stack
  ];

  system.activationScripts = {
    stackSetup = {
      text = ''
        cd /home/kuznero
        if [[ ! -d .stack ]]; then mkdir .stack; fi
        if [[ -f .stack/config.yaml ]]; then rm .stack/config.yaml; fi
        ln -fs /etc/nixos/dotfiles/.stack/config.yaml .stack/config.yaml
        chown -R kuznero:users .stack
      '';
      deps = ["users"];
    };
  };

}
