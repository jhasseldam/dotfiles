{ config, pkgs, ... }:

{
  environment.variables.HTTP_PROXY = "http://127.0.0.1:3128/";
  environment.variables.HTTPS_PROXY = "http://127.0.0.1:3128/";
  networking = {
    hostName = "soul";
    domain = "danskenet.net";
    search = [ "danskenet.net" ];
    proxy.default = "http://127.0.0.1:3128/";
    firewall.enable = false;
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    networkmanager.enable = true;
    # nameservers = [
    #   "8.8.8.8"
    #   "8.8.4.4"
    # ];
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
