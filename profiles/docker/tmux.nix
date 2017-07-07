{ config, pkgs, ... }:

let
  global = (import ./global.nix);
in
  {
    environment.systemPackages = with pkgs; [
      tmux
    ];

    system.activationScripts = {
      tmuxDotfiles = {
        text = ''
          cd /home/${global.userName}
          if [[ -f .tmux.conf ]]; then rm -rf .tmux.conf; fi
          ln -fs /etc/nixos/dotfiles/.tmux.conf .tmux.conf
          cd /root
          if [[ -f .tmux.conf ]]; then rm -rf .tmux.conf; fi
          ln -fs /etc/nixos/dotfiles/.tmux.conf .tmux.conf
        '';
        deps = ["users"];
      };
    };

  }
