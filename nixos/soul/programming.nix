{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnumake
    stack cabal2nix graphviz zlibStatic
    texlive.combined.scheme-full
    meld
    inotify-tools
  ];

}
