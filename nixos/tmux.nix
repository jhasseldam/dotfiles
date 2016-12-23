{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    tmux
  ];

  system.activationScripts = {
    tmuxDotfiles = {
      text = ''
        cd /home/kuznero
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
