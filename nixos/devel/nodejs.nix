{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; with nodePackages; [
    npm
  ];
}
