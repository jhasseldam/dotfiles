{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnumake
    octaveFull
    stack cabal2nix graphviz zlibStatic
    texlive.combined.scheme-full
    meld
    inotify-tools
  ];

}
