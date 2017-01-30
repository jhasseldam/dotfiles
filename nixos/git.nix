{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gitAndTools.gitFull
  ];

  system.activationScripts = {
    gitDotfiles = {
      text = ''
        cd /home/kuznero
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
