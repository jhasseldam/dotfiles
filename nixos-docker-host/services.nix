{ config, pkgs, ... }:

{
  services = {
    openssh.enable = true;
    printing.enable = false;
    xserver.enable = false;
  };
}
