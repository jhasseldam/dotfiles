{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    libnotify
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
      displayManager.lightdm.enable = true;
      desktopManager.xfce = {
        enable = true;
        thunarPlugins = with pkgs.xfce; [
          thunar-archive-plugin thunar-dropbox-plugin thunar_volman
        ];
      };
      resolutions = [
        # { x = 1920; y = 1080; }
        { x = 1600; y = 900; }
      ];
      xrandrHeads = [ "eDP1" "DP1" ];
      synaptics = {
        enable = true;
        twoFingerScroll = true;
      };
    };
    udisks2.enable = true;
  };

  system.activationScripts = {
    gnomeDotfiles = {
      text = ''
        cd /home/kuznero
        if [[ -d .icons/capitaine-cursors ]]; then rm -rf .icons/capitaine-cursors; fi
        if [[ ! -d .icons ]]; then mkdir .icons; fi
        ln -s /etc/nixos/dotfiles/.icons/capitaine-cursors .icons/capitaine-cursors
      '';
      deps = ["users"];
    };
  };

}
