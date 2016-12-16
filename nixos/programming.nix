{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnumake
    texlive.combined.scheme-full
    meld
    mono46 fsharp
  ];
}
