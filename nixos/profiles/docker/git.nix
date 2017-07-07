{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gitAndTools.gitFull
  ];
}
