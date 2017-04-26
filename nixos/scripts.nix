{ config, pkgs, ... }:

{
  system.activationScripts = {
    scriptsSetup = {
      text = ''
        cd /home/kuznero
        if [[ -d .scripts ]]; then rm -rf .scripts; fi
        mkdir .scripts
        cp -R /etc/nixos/dotfiles/.scripts /home/kuznero/
        chown -R kuznero:users .scripts
      '';
      deps = ["users"];
    };
  };
}
