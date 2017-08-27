{ config, pkgs, ... }:

let
  global = (import ../global.nix);
in
  {
    environment.systemPackages = with pkgs; [
      libnotify

      gtk-engine-murrine
      numix-gtk-theme
      paper-icon-theme

      # xfce.xfce4_cpufreq_plugin
      xfce.xfce4_systemload_plugin
      xfce.xfce4_xkb_plugin
      # xfce.xfce4_embed_plugin
      xfce.xfce4_battery_plugin
      # xfce.xfce4_verve_plugin
      # xfce.xfce4_notes_plugin
      # xfce.xfce4_dict_plugin
      xfce.xfce4_clipman_plugin
      xfce.xfce4_datetime_plugin
      # xfce.xfce4_netload_plugin
      # xfce.gigolo
      xfce.xfce4taskmanager
      # xfce.xfce4_cpugraph_plugin
      # xfce.xfce4_eyes_plugin
      # xfce.xfce4_fsguard_plugin
      xfce.xfce4_genmon_plugin
      # xfce.xfce4_weather_plugin
      # xfce.xfce4_whiskermenu_plugin
    ];

    hardware = {
      bumblebee = {
        connectDisplay = true;
        enable = true;
      };
    };

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
        startDbusSession = true;
        displayManager = {
          lightdm.enable = true;
          sessionCommands = ''
            xrandr --output eDP-1 --scale 0.4x0.4
          '';
        };
        desktopManager.xfce = {
          enable = true;
          thunarPlugins = with pkgs.xfce; [
            thunar-archive-plugin
            thunar-dropbox-plugin
            thunar_volman
          ];
        };
        # resolutions = [
        #   { x = 1920; y = 1080; }
        #   # { x = 1600; y = 900; }
        # ];
        # xrandrHeads = [ "eDP1" "DP1" ];
        synaptics = {
          enable = true;
          twoFingerScroll = true;
        };
        videoDrivers = [ "intel nvidia" ];
      };
      udisks2.enable = true;
      dbus = {
        enable = true;
        packages = with pkgs; [ gnome3.dconf ];
      };
    };

    system.activationScripts = {
      gnomeDotfiles = {
        text = ''
          cd /home/${global.userName}
          if [[ -d .icons/capitaine-cursors ]]; then rm -rf .icons/capitaine-cursors; fi
          if [[ ! -d .icons ]]; then mkdir .icons; fi
          ln -s /etc/nixos/dotfiles/.icons/capitaine-cursors .icons/capitaine-cursors
        '';
        deps = ["users"];
      };
    };

  }
