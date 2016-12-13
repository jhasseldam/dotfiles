{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
  ];

  system.activationScripts = {
    gitDotfiles = {
      text = ''
        cd /home/kuznero
        ln -fs /etc/nixos/dotfiles/.gitconfig .gitconfig
        cd /root
        ln -fs /etc/nixos/dotfiles/.gitconfig .gitconfig
      '';
      deps = ["users"];
    };
  };

}
