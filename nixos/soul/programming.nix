{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnumake
    stack cabal2nix graphviz zlibStatic
    meld
    inotify-tools
  ];

}
