{ config, pkgs, ... }:

{
  nixpkgs.config = {
    allowUnfree = true;
    # chromium = {
    #   enablePepperPDF = true;
    #   # enableWideVine = true;
    # };
    virtualbox.enableExtensionPack = true;
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
}
