{ config, pkgs, ... }:

let
  global = (import ./global.nix);
in
  {
    system.activationScripts = {
      scriptsSetup = {
        text = ''
          cd /home/${global.userName}
          if [[ -d .scripts ]]; then rm -rf .scripts; fi
          mkdir .scripts
          cp -R /etc/nixos/dotfiles/.scripts /home/${global.userName}/
          chown -R ${global.userName}:users .scripts
        '';
        deps = ["users"];
      };
    };
  }
