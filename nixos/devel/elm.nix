{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; with elmPackages; [
    elm-compiler
    elm-make
    elm-package
    elm-reactor
    elm-repl
  ];
}
