{ config, pkgs, ... }:

{
  nixpkgs.config = {
    packageOverrides = super: let self = super.pkgs; in {
      fsharp = super.fsharp.override {
        mono = pkgs.mono46;
      };
    };
  };
  environment.systemPackages = with pkgs; [
    mono46 fsharp
    dotnetPackages.FSharpAutoComplete
    dotnetPackages.FSharpCompilerCodeDom
    dotnetPackages.FSharpCompilerService
    dotnetPackages.FSharpData
    dotnetPackages.FSharpFormatting
  ];
}
