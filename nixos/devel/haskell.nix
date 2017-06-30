{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ghc80Env
    # ghc80ProfEnv
  ];

  nixpkgs.config.packageOverrides = super: rec {
    haskell802Packages = super.haskell.packages.ghc802.override {
      overrides = myHaskellPackages false;
    };
    profiledHaskell802Packages = super.haskell.packages.ghc802.override {
      overrides = myHaskellPackages true;
    };
    myHaskellPackages = libProf: self: super:
      with pkgs.haskell.lib;
      rec {
        ghc-syb-utils = pkgs.haskell.lib.dontCheck super.ghc-syb-utils;
        mkDerivation = args: super.mkDerivation (args // {
          enableLibraryProfiling = libProf;
          enableExecutableProfiling = false;
        });
      };
    ghc80Env = super.pkgs.buildEnv {
      name = "ghc80";
      paths = with haskell802Packages; [
        ( ghcWithHoogle ( haskellPackages: with haskellPackages; [
            aeson
            amqp
            array
            async
            attoparsec
            base
            bytestring
            containers
            directory
            hakyll
            hashable
            hspec
            hspec-expectations-pretty-diff
            lens
            linear
            logging
            memoize
            mtl
            pandoc
            QuickCheck
            quickcheck-instances
            regex-compat
            stm
            template-haskell
            text
            vector
          ] )
        )
        alex
        cabal-install
        cabal2nix
        ghc-core
        ghc-mod
        hakyll
        happy
        hasktags
        hindent
        hlint
        hpack
        pandoc
        stylish-haskell
        threadscope
      ];
    };
    ghc80ProfEnv = super.pkgs.myEnvFun {
      name = "ghc80prof";
      buildInputs = with profiledHaskell802Packages; [
        profiledHaskell802Packages.ghc
        cabal-install
        ghc-core
        hlint
        hasktags
      ];
    };
  };

  system.activationScripts = {
    haskellSetup = {
      text = ''
        cd /home/kuznero
        if [[ ! -d .config/nixpkgs ]]; then mkdir -p .config/nixpkgs; fi
        if [[ -f .config/nixpkgs/config.nix ]]; then rm -f .config/nixpkgs/config.nix; fi
        ln -fs /etc/nixos/dotfiles/.config/nixpkgs/config.nix .config/nixpkgs/config.nix
        chown -R kuznero:users .config
      '';
      deps = ["users"];
    };
  };

}
