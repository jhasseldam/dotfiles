{ config, pkgs, ... }:

{
  imports =
    [ ./x/xfce.nix
      # ./x/gnome.nix
      # ./x/plasma.nix
    ];
}
