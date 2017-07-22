{ config, pkgs, ... }:

let
  plugins = pkgs.callPackage ./vim/plugins.nix {};
in
{
  nixpkgs.config.packageOverrides = pkgs : with pkgs; rec {
    nvim = pkgs.neovim.override {
      vimAlias = false;
      configure = {
        customRC = builtins.readFile ./dotfiles/.vimrc;
        vam.knownPlugins = vimPlugins // plugins;
        vam.pluginDictionaries = [
          { names = [
              "neomake"
              "vim-polyglot"
              "youcompleteme"
              "vimproc"
              "syntastic"
              "tabular"
              "tlib"
              "ghcmod"
              "necoghc"
              "hindent"
              "vim2hs"
              "nerdtree"
              "ctrlp"
              "surround"
              "nerdcommenter"
              "airline"
              "airline-themes"
              "fugitive"
              "multiple-cursors"
              "gitgutter"
              "signify"
              "toml"
              "fsharp"
              "elm"
              "kuvim-themes"
              "colorschemes"
              "colorstepper"
          ]; }
          # { names = [
          #   # "elm-vim"
          #   # # "ghc-mod-vim"
          #   # # "neco-ghc"
          # ]; }
        ];
      };
    };
    nvim-qt = pkgs.neovim-qt.override {
      neovim = nvim;
    };
  };

  environment.systemPackages = with pkgs; [
    nvim
    nvim-qt
  ];
}
