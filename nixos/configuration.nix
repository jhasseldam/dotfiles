{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./bootloader.nix
      ./devel.nix
      ./fonts.nix
      ./git.nix
      ./hardware-configuration.nix
      ./kernel.nix
      ./logind.nix
      ./networking.nix
      ./packages.nix
      ./scripts.nix
      ./security.nix
      ./shell.nix
      ./tmux.nix
      ./users.nix
      ./vim.nix
      ./virtualization.nix
      ./x.nix
    ];

  nixpkgs.config = {
    allowUnfree = true;
    firefox.enableAdobeFlash = true;
    pulseaudio = true;
  };

  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "Europe/Copenhagen";

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "17.03";
}
