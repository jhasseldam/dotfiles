{ config, pkgs, ... }:

{
  nixpkgs.config.packageOverrides = pkgs: rec {
    my-elm-format = pkgs.elmPackages.elm-format.overrideDerivation (oldAttrs: {
      # postInstall = oldAttrs.postInstall + ''
      postInstall = ''
        ln -s $out/bin/elm-format-0.18 $out/bin/elm-format
      '';
    });
  };

  environment.systemPackages = with pkgs; with elmPackages; [
    elm
    elm-compiler
    my-elm-format # when `elm-format` symlink to latest version is in place, revert to `elm-format`
    elm-make
    elm-package
    elm-reactor
    elm-repl
  ];
}
