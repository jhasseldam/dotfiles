{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    maven jdk
  ];

  system.activationScripts = {
    programmingDotfiles = {
      text = ''
        cd /home/kuznero
        if [[ -d .m2 ]]; then rm -rf .m2; fi
        mkdir .m2
        ln -fs /etc/nixos/dotfiles/.m2/settings.xml .m2/settings.xml
        chown -R kuznero:users .m2
      '';
      deps = ["users"];
    };
  };

}
