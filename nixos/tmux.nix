{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    tmux
  ];

  system.activationScripts = {
    vimDotfiles = {
      text = ''
        cd /home/kuznero
        ln -fs /etc/nixos/dotfiles/.tmux.conf .tmux.conf
        cd /root
        ln -fs /etc/nixos/dotfiles/.tmux.conf .tmux.conf
      '';
      deps = ["users"];
    };
  };

}
