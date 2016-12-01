# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  boot = {
    loader = {
      grub = {
        enable = true;
        version = 2;
        device = "/dev/sdb"; # or "nodev" for efi only
      };
    };
  };

  networking = {
    hostName = "buddha";
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    networkmanager.enable = true;
    nameservers = [
      "8.8.8.8"
      "8.8.4.4"
    ];
  };

  nixpkgs.config = {
    allowUnfree = true;
    chromium = {
      enablePepperPDF = true;
      # enableWideVine = true;
    };
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

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    wget curl htop zsh gparted manpages pavucontrol
    # Internet
    firefox chromium hexchat
    # Programming
    vim emacs git
    stack
    # Xfce
    gtk                  # To get GTK+'s themes
    gnome.gnomeicontheme # more icons
    hicolor_icon_theme   # icons for thunar
    shared_mime_info
    xfce.exo
    xfce.gtk_xfce_engine
    xfce.gvfs            # auto mounting
    xfce.libxfce4ui
    xfce.libxfcegui4
    xfce.thunar          # file manager
    xfce.thunar_volman   # auto mounting
    xfce.xfce4icontheme  # for thunar
    xfce.xfce4settings
    xfce.xfconf
    zathura # pdf viewer
  ];

  # /var/run/current-system/sw/etc/profile
  environment.shellInit = ''
    # ===================================
    # SYSTEM WIDE CONFIGURATION GOES HERE
    # ===================================
    # Set GTK_PATH so that GTK+ can find the Xfce theme engine.
    export GTK_PATH=${pkgs.xfce.gtk_xfce_engine}/lib/gtk-2.0
    
    # Set GTK_DATA_PREFIX so that GTK+ can find the Xfce themes.
    export GTK_DATA_PREFIX=${config.system.path}
    # Set GIO_EXTRA_MODULES so that gvfs works.
    export GIO_EXTRA_MODULES=${pkgs.xfce.gvfs}/lib/gio/modules
    # Launch xfce settings daemon.
    xfsettingsd &
    # ===================================
  '';

  environment.pathsToLink =
    [ "/share/xfce4" "/share/themes" "/share/mime" "/share/desktop-directories"];

  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      andagii
      anonymousPro
      # arkpandora_ttf
      # bakoma_ttf
      # cantarell_fonts
      # corefonts
      # clearlyU
      # cm_unicode
      dejavu_fonts
      # freefont_ttf
      fira-mono
      # gentium
      inconsolata
      liberation_ttf
      # libertine
      # lmodern
      # mph_2b_damase
      # oldstandard
      # theano
      # tempora_lgc
      terminus_font
      ttf_bitstream_vera
      # ucsFonts
      # unifont
      vistafonts
      # wqy_zenhei
    ];
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable the X11 windowing system.
  services = {
    xserver = {
      enable = true;
      layout = "us";
      # xkbOptions = "eurosign:e";
      displayManager.slim.enable = true;
      desktopManager.xfce.enable = true;
      synaptics = {
        enable = true;
        twoFingerScroll = true;
        additionalOptions = ''
          Option "ClickPad" "true"
          Option "EmulateMidButtonTime" "0"
          Option "SoftButtonAreas" "50% 0 82% 0 0 0 0 0"
        '';
      };
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.kuznero = {
    isNormalUser = true;
    home = "/home/kuznero";
    description = "Roman";
    extraGroups = [ "wheel" "networkmanager" ];
    initialPassword = "kuznero";
    shell = "/run/current-system/sw/bin/zsh";
  };

  virtualisation = {
    docker = {
      enable = true;
      socketActivation = true;
    };
    virtualbox = {
      host.enable = true;
    };
  };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "16.09";

}
