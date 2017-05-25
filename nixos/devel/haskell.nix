{ config, pkgs, ... }:

let
  unstable = (import (fetchTarball https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz) {
    inherit (config.nixpkgs) config system;
  }).pkgs;
in
{
  environment.systemPackages = with pkgs; [
    unstable.stack
    cabal2nix
  ];

  system.activationScripts = {
    stackSetup = {
      text = ''
        cd /home/kuznero
        if [[ ! -d .stack/global-project ]]; then mkdir -p .stack/global-project; fi
        if [[ -f .stack/config.yaml ]]; then rm .stack/config.yaml; fi
        ln -fs /etc/nixos/dotfiles/.stack/config.yaml .stack/config.yaml
        if [[ -f .stack/global-project/stack.yaml ]]; then rm .stack/global-project/stack.yaml; fi
        ln -fs /etc/nixos/dotfiles/.stack/global-project/stack.yaml .stack/global-project/stack.yaml
        chown -R kuznero:users .stack
      '';
      deps = ["users"];
    };
  };

}
