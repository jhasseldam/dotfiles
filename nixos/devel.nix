{ config, pkgs, ... }:

{

  imports =
    [ ./devel/haskell.nix
      ./devel/erlang.nix
      ./devel/dotnet.nix
      ./devel/java.nix
      ./devel/python.nix
    ];

  environment.systemPackages = with pkgs; [
    binutils
  ];

}
