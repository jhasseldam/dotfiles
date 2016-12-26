{ config, pkgs, ... }:

{
  networking = {
    hostName = "buddha";
    domain = "kuznero.net";
    # fix for missing hosts entry https://github.com/NixOS/nixpkgs/issues/1248
    extraHosts = ''
      127.0.0.1 buddha.kuznero.net buddha
      ::1 buddha.kuznero.net buddha
    '';
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    networkmanager.enable = true;
    nameservers = [ "192.168.8.107" ];
    firewall = {
      enable = true;
      allowPing = true;
      allowedTCPPorts = [ 22 ];
      allowedUDPPorts = [];
    };
  };
}
