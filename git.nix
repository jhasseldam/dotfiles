{ config, pkgs, ... }:

let
  global = (import ./global.nix);
in
  {
    environment.systemPackages = with pkgs; [
      gitAndTools.gitFull
      gitg
    ];
  
    system.activationScripts = {
      gitDotfiles = {
        text = ''
          cd /home/${global.userName}
          if [[ -f .gitconfig ]]; then rm -rf .gitconfig; fi
          ln -fs /etc/nixos/dotfiles/.gitconfig .gitconfig
          cd /root
          if [[ -f .gitconfig ]]; then rm -rf .gitconfig; fi
          ln -fs /etc/nixos/dotfiles/.gitconfig .gitconfig
        '';
        deps = ["users"];
      };
    };
  
  }
