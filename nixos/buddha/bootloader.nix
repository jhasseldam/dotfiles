{ config, pkgs, ... }:

{
  # Use the GRUB 2 boot loader.
  boot = {
    loader = {
      grub = {
        enable = true;
        version = 2;
        device = "/dev/sda"; # or "nodev" for efi only
      };
    };
  };
}
