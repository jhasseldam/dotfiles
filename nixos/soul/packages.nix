{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Common
    wget curl bind htop gksu ntfs3g inetutils
    enlightenment.terminology zip unzip
    # Internet
    chromium hexchat dropbox qbittorrent
    # Office
    evince poppler_utils
    # Multimedia
    vlc
    # Xfce 4
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
}
