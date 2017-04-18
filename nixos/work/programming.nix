{ config, pkgs, ... }:

{
  nixpkgs.config = {
    packageOverrides = super: let self = super.pkgs; in {
      fsharp = super.fsharp.override {
        mono = pkgs.mono46;
      };
    };
  };

  environment.systemPackages = with pkgs; [
    gnumake
    diffuse
    python27Full
    nodejs-6_x
    mono46 fsharp dotnetPackages.FSharpAutoComplete dotnetPackages.FSharpCompilerCodeDom dotnetPackages.FSharpCompilerService dotnetPackages.FSharpData dotnetPackages.FSharpFormatting
    redis-desktop-manager
    pgadmin
  ];

  system.activationScripts = {
    programmingDotfiles = {
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
