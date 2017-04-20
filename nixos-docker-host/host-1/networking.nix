{ config, pkgs, ... }:

{
  networking = {
    hostName = "host-1";
    domain = "kuznero.local";
    useDHCP = false;
    interfaces = {
      enp0s3.ip4 = [
        { address = "192.168.8.201"; prefixLength = 24; }
      ];
    };
    # networkmanager.enable = true;
    nameservers = [ "192.168.8.1" ];
    defaultGateway = "192.168.8.1";
    firewall = {
      enable = false;
      allowPing = true;
      allowedTCPPorts = [ 22 ];
      allowedUDPPorts = [];
    };
    extraHosts = ''
      192.168.8.201 host-1
      192.168.8.202 host-2
      192.168.8.203 host-3
    '';
  };
}
