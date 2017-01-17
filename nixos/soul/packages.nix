{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Common
    wget curl bind htop gksu ntfs3g
    enlightenment.terminology
    # Internet
    chromium hexchat irssi dropbox elinks qbittorrent
    viber skype
    # Office
    evince poppler_utils
    # Multimedia
    gthumb vlc
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
  ];
}
