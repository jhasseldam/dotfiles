{ config, pkgs, ... }:

{
  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      anonymousPro
      cantarell_fonts
      dejavu_fonts
      fira
      fira-code
      fira-mono
      font-droid
      inconsolata
      liberation_ttf
      terminus_font
      vistafonts
      powerline-fonts
    ];
  };
}
