{ config, pkgs, ... }:

let
  global = (import ../global.nix);
in
  {
    environment.systemPackages = with pkgs; [
      maven jdk
    ];

    system.activationScripts = {
      mavenSetup = {
        text = ''
          cd /home/${global.userName}
          if [[ -d .m2 ]]; then rm -rf .m2; fi
          mkdir .m2
          ln -fs /etc/nixos/dotfiles/.m2/settings.xml .m2/settings.xml
          chown -R ${global.userName}:users .m2
        '';
        deps = ["users"];
      };
    };

  }
