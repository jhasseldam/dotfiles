{ config, pkgs, ... }:

{
  fonts = {
    enableCoreFonts = true;
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
      hack-font
      inconsolata
      iosevka
      liberation_ttf
      powerline-fonts
      terminus_font
      unifont
      vistafonts
    ];
  };
}
