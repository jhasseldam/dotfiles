{ config, pkgs, ... }:

{
  networking = {
    hostName = "buddha";
    domain = "local";
    # fix for missing hosts entry https://github.com/NixOS/nixpkgs/issues/1248
    extraHosts = ''
      127.0.0.1 buddha.local buddha
      ::1 buddha.local buddha
    '';
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    networkmanager.enable = true;
    nameservers = [ "127.0.0.1" ];
    firewall = {
      enable = true;
      allowPing = true;
      allowedTCPPorts = [ 22 ];
      allowedUDPPorts = [];
    };
  };
  services.bind.enable = true;
  services.bind.forwarders = [ "8.8.8.8" "8.8.4.4" ];
}
