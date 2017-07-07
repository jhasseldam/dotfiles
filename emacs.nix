{ config, pkgs, ... }:

let
  global = (import ./global.nix);
in
  {
    environment.systemPackages = with pkgs; [
      emacs
    ];
  
    system.activationScripts = {
      emacsDotfiles = {
        text = ''
          PATH=${pkgs.git}/bin:$PATH
          cd /home/${global.userName}
          if [[ -f .spacemacs ]]; then rm -rf .spacemacs; fi
          ln -fs /etc/nixos/dotfiles/.spacemacs .spacemacs
          if [[ ! -d .emacs.d ]]; then
            git clone --depth=1 https://github.com/syl20bnr/spacemacs .emacs.d
          fi
          chown ${global.userName}:users -R .emacs.d/
          cd /root
          if [[ -f .spacemacs ]]; then rm -rf .spacemacs; fi
          ln -fs /etc/nixos/dotfiles/.spacemacs .spacemacs
          if [[ ! -d .emacs.d ]]; then
            git clone --depth=1 https://github.com/syl20bnr/spacemacs .emacs.d
          fi
        '';
        deps = ["users"];
      };
    };
  
  }
