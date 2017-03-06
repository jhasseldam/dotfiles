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
    octaveFull
    stack cabal2nix graphviz zlibStatic
    texlive.combined.scheme-full
    diffuse
    python27Full
    nodejs-6_x
    mono46 fsharp dotnetPackages.FSharpAutoComplete dotnetPackages.FSharpCompilerCodeDom dotnetPackages.FSharpCompilerService dotnetPackages.FSharpData dotnetPackages.FSharpFormatting
    maven jdk
    inotify-tools
    redis-desktop-manager
    pgadmin
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
