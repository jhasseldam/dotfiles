{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    emacs25
  ];

  system.activationScripts = {
    emacsDotfiles = {
      text = ''
        cd /home/kuznero
        if [[ -d .emacs.d ]]; then rm -rf .emacs.d; fi
        if [[ -f .emacs ]]; then rm .emacs; fi
        ln -fs /etc/nixos/dotfiles/.emacs .emacs
        cd /root
        if [[ -d .emacs.d ]]; then rm -rf .emacs.d; fi
        if [[ -f .emacs ]]; then rm .emacs; fi
        ln -fs /etc/nixos/dotfiles/.emacs .emacs
      '';
      deps = ["users"];
    };
  };

}
