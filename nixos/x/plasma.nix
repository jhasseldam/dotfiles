{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    konversation
    ksshaskpass
    kdeApplications.ark
    kdeApplications.gwenview
    kdeApplications.okular
    kdeApplications.spectacle
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
      displayManager.sddm = {
        enable = true;
        autoNumlock = true;
      };
      desktopManager.plasma5.enable = true;
    };
    udisks2.enable = true;
  };
}
