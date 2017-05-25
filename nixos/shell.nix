{ config, pkgs, ... }:

{
  imports =
    [ ./shell/zsh.nix
    ];

  system.activationScripts = {
    shellDotfiles = {
      text = ''
        ln -fs /etc/nixos/dotfiles/.bashrc .bashrc
      '';
      deps = ["users"];
    };
  };

}
