{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnumake
    octaveFull
    stack graphviz zlibStatic
    diffuse
    inotify-tools
  ];
}
