{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wget curl htop inetutils zip unzip
  ];
}
