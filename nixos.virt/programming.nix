{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    stack
    texlive.combined.scheme-full
    meld
  ];
}
