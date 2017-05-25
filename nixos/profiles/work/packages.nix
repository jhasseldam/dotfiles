{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Common
    wget curl bind htop gksu ntfs3g inetutils
    zip unzip gparted
    # Internet
    vivaldi firefox
    # Office
    octaveFull graphviz
    evince poppler_utils
    # Common devel
    gnumake diffuse meld
    redis-desktop-manager
    pgadmin
  ];
}
