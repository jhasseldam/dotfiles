{ config, pkgs, ... }:

{

  imports =
    [ ../../devel/dotnet.nix
      ../../devel/elm.nix
      # ../../devel/erlang.nix
      ../../devel/haskell.nix
      ../../devel/java.nix
      ../../devel/nix.nix
      # ../../devel/nodejs.nix
      # ../../devel/python.nix
    ];

  environment.systemPackages = with pkgs; [
    gnumake
    binutils
    jq
    tree
    meld
    file
    redis-desktop-manager
    pgadmin
  ];

}
