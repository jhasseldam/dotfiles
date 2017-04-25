{ config, pkgs, ... }:

{
  environment.variables.HTTP_PROXY = "http://127.0.0.1:3128/";
  environment.variables.HTTPS_PROXY = "http://127.0.0.1:3128/";
  networking = {
    hostName = "host-1";
    domain = "danskenet.net";
    search = [ "danskenet.net" ];
    proxy.default = "http://127.0.0.1:3128/";
    useDHCP = false;
    interfaces = {
      enp0s3.ip4 = [
        { address = "10.99.1.201"; prefixLength = 24; }
      ];
    };
    # networkmanager.enable = true;
    nameservers = [ "10.99.1.1" ];
    defaultGateway = "10.99.1.1";
    firewall = {
      enable = false;
      allowPing = true;
      allowedTCPPorts = [ 22 ];
      allowedUDPPorts = [];
    };
    extraHosts = ''
      10.99.1.201 host-1
      10.99.1.202 host-2
      10.99.1.203 host-3
    '';
  };
  services.cntlm = {
    enable = true;
    username = "user";
    password = "password";
    domain = "domain";
    proxy = [ "10.81.220.156:80" ];
    extraConfig = ''
      NoProxy *.danskenet.net docker-hub
    '';
  };
}
