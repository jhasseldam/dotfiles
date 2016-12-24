{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  services = {
    openssh.enable = true;
    printing = {
      enable = true;
      drivers = [ pkgs.gutenprint ];
    };
    xserver = {
      enable = true;
      layout = "us";
      # xkbOptions = "eurosign:e";
      displayManager.gdm.enable = true;
      desktopManager.gnome3 = {
        enable = true;
        extraGSettingsOverrides = ''
          [org.gnome.desktop.peripherals.touchpad]
          tap-to-click=true
        '';
      };
    };
    gnome3.gnome-keyring.enable = true;
  };
}
