{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnome3.gnome_terminal
    xfce.xfce4_cpufreq_plugin
    xfce.xfce4_systemload_plugin
    xfce.xfce4_xkb_plugin
    xfce.xfce4_embed_plugin
    xfce.xfce4_battery_plugin
    xfce.xfce4_verve_plugin
    # xfce.xfce4_notes_plugin
    # xfce.xfce4_dict_plugin
    xfce.xfce4_clipman_plugin
    xfce.xfce4_datetime_plugin
    xfce.xfce4_netload_plugin
    xfce.gigolo
    xfce.xfce4taskmanager
    xfce.xfce4_cpugraph_plugin
    # xfce.xfce4_eyes_plugin
    xfce.xfce4_fsguard_plugin
    xfce.xfce4_genmon_plugin
    xfce.xfce4_pulseaudio_plugin
    # xfce.xfce4_weather_plugin
    # xfce.xfce4_whiskermenu_plugin
  ];
  # systemd.packages = with pkgs; [
  #   gnome3.gnome_terminal
  # ];
  # services = {
  #   gnome3.gnome-terminal-server.enable = true;
  # };
  services = {
    dbus.packages = with pkgs; [
      gnome3.ghome_terminal
    ];
    openssh.enable = true;
    printing = {
      enable = true;
      drivers = [ pkgs.gutenprint ];
    };
    xserver = {
      enable = true;
      layout = "us";
      # xkbOptions = "eurosign:e";
      displayManager.lightdm.enable = true;
      desktopManager.xfce = {
        enable = true;
        thunarPlugins = with pkgs.xfce; [
          thunar-archive-plugin thunar-dropbox-plugin thunar_volman
        ];
      };
      synaptics = {
        enable = true;
        twoFingerScroll = true;
      };
    };
    udisks2.enable = true;
  };

}
