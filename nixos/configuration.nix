# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./private/bootloader.nix
      ./private/networking.nix
      ./private/virtualization.nix
      ./fonts.nix
      ./packages.nix
      ./programming.nix
      ./zsh.nix
      ./vim.nix
      ./git.nix
      ./users.nix
      ./services.nix
    ];

  nixpkgs.config = {
    allowUnfree = true;
    # chromium = {
    #   enablePepperPDF = true;
    #   # enableWideVine = true;
    # };
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
  system.stateVersion = "16.09";

}
