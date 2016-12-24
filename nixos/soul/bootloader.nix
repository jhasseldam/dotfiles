{ config, pkgs, ... }:

{
  # Use the GRUB 2 boot loader.
  boot = {
    loader = {
      grub = {
        enable = true;
        version = 2;
        device = "/dev/sdb"; # or "nodev" for efi only
      };
    };
  };
}
