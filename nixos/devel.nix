{ config, pkgs, ... }:

{

  imports =
    [ ./devel/dotnet.nix
      ./devel/elm.nix
      ./devel/erlang.nix
      ./devel/haskell.nix
      ./devel/java.nix
      ./devel/python.nix
    ];

  environment.systemPackages = with pkgs; [
    binutils
  ];

}
