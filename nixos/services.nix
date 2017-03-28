{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnome3.pomodoro
  ];

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
        sessionPath = with pkgs.gnome3; [ pomodoro ];
      };
    };
    gnome3.gnome-keyring.enable = true;
    udisks2.enable = true;
  };
}
