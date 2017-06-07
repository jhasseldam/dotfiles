{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Common
    wget curl bind htop gksu ntfs3g inetutils
    zip unzip gparted
    # Internet
    vivaldi firefox chatzilla
    # Office
    octaveFull graphviz texlive.combined.scheme-full
    evince poppler_utils
    # Common devel
    gnumake diffuse meld
    redis-desktop-manager
    pgadmin
  ];
}
