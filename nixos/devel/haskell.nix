{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cabal-install
    cabal2nix
  ];
}
