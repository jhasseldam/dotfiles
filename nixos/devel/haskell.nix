{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; with haskellPackages; [
    cabal-install
    cabal2nix
    (ghcWithPackages (self : [
      self.ghc-mod
      self.hlint
      self.hoogle
      self.stylish-haskell
      self.intero
      self.hasktags
      self.apply-refact
      self.hindent
    ]))
  ];

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
