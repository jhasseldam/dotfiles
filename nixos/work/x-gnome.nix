{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnome3.pomodoro
    gnome3.gconf
    gnome3.gnome-tweak-tool
  ];

  # [org.gnome.desktop.wm.keybindings]
  # activate-window-menu=["<Alt>space"]
  # always-on-top=[""]
  # begin-move=["<Alt>F7"]
  # begin-resize=["<Alt>F8"]
  # close=["<Super><Shift>c", '<Alt>F4']
  # cycle-group-backward=["<Shift><Alt>F6"]
  # cycle-group=["<Alt>F6"]
  # cycle-panels-backward=["<Shift><Control><Alt>Escape"]
  # cycle-panels=["<Control><Alt>Escape"]
  # cycle-windows-backward=["<Shift><Alt>Escape"]
  # cycle-windows=["<Alt>Escape"]
  # lower=[""]
  # maximize-horizontally=["<Super>n"]
  # maximize-vertically=["<Super>y"]
  # maximize=["<Super>Page_Up"]
  # minimize=["<Super>Page_Down"]
  # move-to-center=["<Super>h"]
  # move-to-corner-ne=["<Super>k"]
  # move-to-corner-nw=["<Super>j"]
  # move-to-corner-se=["<Super>semicolon"]
  # move-to-corner-sw=["<Super>l"]
  # move-to-monitor-down=[""]
  # move-to-monitor-left=[""]
  # move-to-monitor-right=[""]
  # move-to-monitor-up=[""]
  # move-to-side-e=[""]
  # move-to-side-n=[""]
  # move-to-side-s=[""]
  # move-to-side-w=[""]
  # move-to-workspace-10=[""]
  # move-to-workspace-11=[""]
  # move-to-workspace-12=[""]
  # move-to-workspace-1=["<Super><Shift>1"]
  # move-to-workspace-2=["<Super><Shift>2"]
  # move-to-workspace-3=["<Super><Shift>3"]
  # move-to-workspace-4=["<Super><Shift>4"]
  # move-to-workspace-5=["<Super><Shift>5"]
  # move-to-workspace-6=["<Super><Shift>6"]
  # move-to-workspace-7=["<Super><Shift>7"]
  # move-to-workspace-8=["<Super><Shift>8"]
  # move-to-workspace-9=["<Super><Shift>9"]
  # move-to-workspace-down=["<Super><Shift>Down"]
  # move-to-workspace-last=[""]
  # move-to-workspace-left=["<Super><Shift>Left"]
  # move-to-workspace-right=["<Super><Shift>Right"]
  # move-to-workspace-up=["<Super><Shift>Up"]
  # panel-main-menu=["<Alt>F1"]
  # panel-run-dialog=["<Alt>F2"]
  # raise-or-lower=[""]
  # raise=[""]
  # set-spew-mark=[""]
  # show-desktop=[""]
  # switch-applications-backward=["<Shift><Super>Tab", '<Shift><Alt>Tab']
  # switch-applications=["<Super>Tab", '<Alt>Tab']
  # switch-group-backward=["<Shift><Super>Above_Tab", '<Shift><Alt>Above_Tab']
  # switch-group=["<Super>Above_Tab", '<Alt>Above_Tab']
  # switch-input-source-backward=[""]
  # switch-input-source=[""]
  # switch-panels-backward=["<Shift><Control><Alt>Tab"]
  # switch-panels=["<Control><Alt>Tab"]
  # switch-to-workspace-10=[""]
  # switch-to-workspace-11=[""]
  # switch-to-workspace-12=[""]
  # switch-to-workspace-1=["<Super>1"]
  # switch-to-workspace-2=["<Super>2"]
  # switch-to-workspace-3=["<Super>3"]
  # switch-to-workspace-4=["<Super>4"]
  # switch-to-workspace-5=["<Super>5"]
  # switch-to-workspace-6=["<Super>6"]
  # switch-to-workspace-7=["<Super>7"]
  # switch-to-workspace-8=["<Super>8"]
  # switch-to-workspace-9=["<Super>9"]
  # switch-to-workspace-down=["<Super>Down"]
  # switch-to-workspace-last=["<Super>End"]
  # switch-to-workspace-left=["<Super>Left"]
  # switch-to-workspace-right=["<Super>Right"]
  # switch-to-workspace-up=["<Super>Up"]
  # switch-windows-backward=[""]
  # switch-windows=[""]
  # toggle-above=["<Super><Shift>h"]
  # toggle-fullscreen=[""]
  # toggle-maximized=["<Super>space"]
  # toggle-on-all-workspaces=[""]
  # toggle-shaded=[""]
  # unmaximize=["<Super>Down", '<Alt>F5']

  services = {
    openssh.enable = true;
    printing = {
      enable = true;
      drivers = [ pkgs.gutenprint ];
    };
    xserver = {
      enable = true;
      layout = "us";
      displayManager.gdm.enable = true;
      desktopManager.gnome3 = {
        enable = true;
        extraGSettingsOverrides = ''
          [org.gnome.desktop.peripherals.touchpad]
          tap-to-click=true

          [org.gnome.desktop.wm.keybindings]
          close=["<Control><Shift>F4", "<Super><Shift>c", '<Alt>F4']
          switch-applications=["<Control><Shift>Tab", "<Super>Tab", '<Alt>Tab']
          switch-group=["<Control><Shift>Above_Tab", "<Super>Above_Tab", '<Alt>Above_Tab']
        '';
        sessionPath = with pkgs.gnome3; [ pomodoro ];
      };
    };
    gnome3.gnome-keyring.enable = true;
    udisks2.enable = true;
  };
}
