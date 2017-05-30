{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cabalInstall
    cabal2nix
  ];
}
