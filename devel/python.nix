{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    python35Full
    python35Packages.jupyter
    python35Packages.numpy
  ];
}
