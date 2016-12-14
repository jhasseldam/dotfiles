{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    stack
    texlive.combined.scheme-full
    meld
    mono46 fsharp
  ];
}
