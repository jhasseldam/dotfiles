{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vimHugeX
    (
      let
        vimrc = builtins.readFile ./dotfiles/.vimrc;
        rc = ''
          ${vimrc}
        '';
        plugins = pkgs.callPackage ./vim-plugins.nix {};
      in
        with import <nixpkgs> {};
        vim_configurable.customize {
          name = "kvim";
          vimrcConfig.customRC = rc;
          vimrcConfig.vam.knownPlugins = pkgs.vimPlugins // plugins;
          vimrcConfig.vam.pluginDictionaries = [
            { names = [
                "vimproc"
                "syntastic"
                "nerdtree"
                "ctrlp"
                "surround"
                "airline"
                "airline-themes"
                "fugitive"
                "multiple-cursors"
                "supertab"
                "gitgutter"
                "signify"
                "elm"
                "kuvim-themes"
            ]; }
            # { names = [
            #   # "elm-vim"
            #   # # "ghc-mod-vim"
            #   # # "neco-ghc"
            # ]; }
          ];
        }
    )
  ];

  system.activationScripts = {
    vimDotfiles = {
      text = ''
        cd /home/kuznero
        ln -fs /etc/nixos/dotfiles/.gtkrc-2.0 .gtkrc-2.0
        cd /root
        ln -fs /etc/nixos/dotfiles/.gtkrc-2.0 .gtkrc-2.0
      '';
      deps = ["users"];
    };
  };

}
