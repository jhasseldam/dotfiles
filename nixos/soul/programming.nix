{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnumake
    stack cabal2nix graphviz
    meld
    inotify-tools
  ];

}
