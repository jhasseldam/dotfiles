{ config, pkgs, ... }:

{
  networking = {
    hostName = "buddha";
    domain = "kuznero.local";
    # fix for missing hosts entry https://github.com/NixOS/nixpkgs/issues/1248
    extraHosts = ''
      127.0.0.1 buddha.kuznero.local buddha
      ::1 buddha.kuznero.local buddha
    '';
    # useDHCP = false;
    # interfaces = {
    #   wlp2s0.ip4 = [
    #     { address = "192.168.8.150"; prefixLength = 24; }
    #   ];
    # };
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
