{ config, pkgs, ... }:

{

  imports =
    [ ./devel/dotnet.nix
      ./devel/elm.nix
      # ./devel/erlang.nix
      ./devel/haskell.nix
      # ./devel/java.nix
      # ./devel/nodejs.nix
      # ./devel/python.nix
    ];

  environment.systemPackages = with pkgs; [
    gnumake
    meld
    redis-desktop-manager
    pgadmin
    binutils
    jq
    tree
  ];

}