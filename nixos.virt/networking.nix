{ config, pkgs, ... }:

{
  networking = {
    hostName = "soul";
    domain = "danskenet.net";
    # proxy.default = "http://user:pwd@proxy:3128/";
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    networkmanager.enable = true;
    nameservers = [
      "8.8.8.8"
      "8.8.4.4"
    ];
  };
}
