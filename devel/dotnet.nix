{ config, pkgs, ... }:

let
  unstable = (import (fetchTarball https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz) {
    inherit (config.nixpkgs) config system;
  }).pkgs;
in
{
  environment.systemPackages = with pkgs; [
    mono46 unstable.fsharp41
  ];
}
