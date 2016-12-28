{ config, pkgs, ... }:

{
  networking = {
    hostName = "moon";
    domain = "kuznero.local";
    # fix for missing hosts entry https://github.com/NixOS/nixpkgs/issues/1248
    extraHosts = ''
      127.0.0.1 moon.kuznero.local moon
      ::1 moon.kuznero.local moon
    '';
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    # useDHCP = false;
    # interfaces = {
    #   enp6s0.ip4 = [
    #     { address = "192.168.8.151"; prefixLength = 24; }
    #   ];
    # };
    networkmanager.enable = true;
    nameservers = [];
    firewall = {
      enable = true;
      allowPing = true;
      allowedTCPPorts = [ 22 ];
      allowedUDPPorts = [];
    };
  };
}
