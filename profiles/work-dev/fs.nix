{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cifs-utils
  ];

  fileSystems = {
    "/mnt/cifs/wh3837/temp" = {
      device = "//WH3837/Temp";
      fsType = "cifs";
      options = [
        "file_mode=0777"
        "dir_mode=0777"
        "rw"
        "noperm"
        "sec=ntlm"
        "iocharset=utf8"
        "x-systemd.automount"
        "vers=2.0"
        "domain=domain"
        "username=username"
        "password=password"
      ];
    };
  };
}
