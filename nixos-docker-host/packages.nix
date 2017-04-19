{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gitAndTools.gitFull wget curl bind htop inetutils zip unzip
  ];
}
