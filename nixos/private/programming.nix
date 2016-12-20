{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnumake
    stack cabal2nix graphviz
    texlive.combined.scheme-full
    meld
    mono46 fsharp pash
    inotify-tools
  ];
}
