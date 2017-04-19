{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  services = {
    logind = {
      # From: http://lists.science.uu.nl/pipermail/nix-dev/2015-July/017657.html
      # The standard way of controlling the size of /run/user is the
      # RuntimeDirectorySize directive
      # in logind.conf [1]. The NixOS interface is services.logind.extraConfig.
      # [1]: http://www.freedesktop.org/software/systemd/man/logind.conf.html
      extraConfig = ''
        RuntimeDirectorySize=4G
      '';
    };
  };
}
