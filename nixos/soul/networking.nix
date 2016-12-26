{ config, pkgs, ... }:

{
  networking = {
    hostName = "soul";
    domain = "kuznero.local";
    # fix for missing hosts entry https://github.com/NixOS/nixpkgs/issues/1248
    extraHosts = ''
      127.0.0.1 soul.kuznero.local soul
      ::1 soul.kuznero.local soul
    '';
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    useDHCP = false;
    interfaces = {
      wlp2s0.ip4 = [
        { address = "192.168.8.152"; prefixLength = 24; }
      ];
    };
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
