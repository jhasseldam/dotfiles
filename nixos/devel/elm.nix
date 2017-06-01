{ config, pkgs, ... }:

{
  nixpkgs.config.packageOverrides = pkgs: with pkgs; {
    elm-format = pkgs.elm-format.overrideDerivation (oldAttrs: {
      postInstall = oldAttrs.postInstall + ''
        ln -s $out/bin/elm-format-0.18 $out/bin/elm-format
      '';
    });
  };

  environment.systemPackages = with pkgs; with elmPackages; [
    elm
    elm-compiler
    elm-format
    elm-make
    elm-package
    elm-reactor
    elm-repl
  ];
}
