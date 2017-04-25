{ config, pkgs, ... }:

{
  imports =
    [ ./devel/haskell.nix
      ./devel/dotnet.nix
      ./devel/java.nix
    ];
}
