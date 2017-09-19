{ config, pkgs, ... }:

{

  environment.shellAliases = {
    gvim = "vim -g -geometry=500x500";
  };

  environment.variables = {
    TERM = "xterm-256color";
  };

}
