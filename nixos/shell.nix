{ config, pkgs, ... }:

{
  imports =
    [ ./shell/zsh.nix
    ];

  system.activationScripts = {
    shellDotfiles = {
      text = ''
        ln -fs /etc/nixos/dotfiles/.bash_profile .bash_profile
      '';
      deps = ["users"];
    };
  };

}
