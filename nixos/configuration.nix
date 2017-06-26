{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./bootloader.nix
      ./devel.nix
      ./emacs.nix
      ./fonts.nix
      ./git.nix
      ./hardware-configuration.nix
      ./kernel.nix
      ./logind.nix
      ./networking.nix
      # ./nvim.nix
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
    firefox.enableAdobeFlash = false;
    pulseaudio = true;
  };

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    pulseaudio = {
      enable = true;
      package = pkgs.pulseaudioFull;
    };
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
