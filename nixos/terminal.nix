{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnome3.gnome_terminal
    gnome3.dconf
    gnome3.dconf-editor
  ];
  services.dbus.packages = with pkgs; [
    gnome3.gnome_terminal
  ];
  systemd.packages = with pkgs; [
    gnome3.gnome_terminal
  ];
  # services = {
  #   gnome3.gnome-terminal-server.enable = true;
  # };
}
