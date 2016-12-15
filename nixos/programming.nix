{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnumake
    stack
    texlive.combined.scheme-full
    meld
    mono46 fsharp
  ];
}
