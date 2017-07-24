{ config, pkgs, ... }:

let
  global = (import ../global.nix);
in
  {
    environment.systemPackages = with pkgs; [
      ghc82Env
      # ghc82ProfEnv
    ];

    nixpkgs.config.packageOverrides = super: rec {
      haskell821Packages = super.haskell.packages.ghc821.override {
        overrides = myHaskellPackages false;
      };
      profiledHaskell821Packages = super.haskell.packages.ghc821.override {
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
      ghc82Env = super.pkgs.buildEnv {
        name = "ghc82";
        paths = with haskell821Packages; [
          ( ghcWithHoogle ( haskellPackages: with haskellPackages; [
              QuickCheck
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
              quickcheck-instances
              regex-compat
              scotty
              stm
              template-haskell
              text
              timeit
              vector
              wai
              wai-app-static
              wai-cors
              wai-extra
              wai-logger
              wai-middleware-static
              wai-routes
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
      ghc82ProfEnv = super.pkgs.myEnvFun {
        name = "ghc82prof";
        buildInputs = with profiledHaskell821Packages; [
          profiledHaskell821Packages.ghc
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
          cd /home/${global.userName}
          if [[ ! -d .config/nixpkgs ]]; then mkdir -p .config/nixpkgs; fi
          if [[ -f .config/nixpkgs/config.nix ]]; then rm -f .config/nixpkgs/config.nix; fi
          ln -fs /etc/nixos/dotfiles/.config/nixpkgs/config.nix .config/nixpkgs/config.nix
          chown -R ${global.userName}:users .config
        '';
        deps = ["users"];
      };
    };

  }
