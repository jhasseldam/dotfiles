{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (python35.withPackages (ps: with ps; [ numpy jupyter ]))
  ];

  # How to setup Python environment in NixOS:
  # https://nixos.org/nixpkgs/manual/#how-can-i-install-a-working-python-environment

  # to start jupyter-notebook, go into nix-shell like this:
  # 1)
  # nix-shell -p 'python3.withPackages (ps: with ps; [ jupyter ])'
  # and then start `jupyter-notebook`
  # 2)
  # or add a function to yout .bashrc file (or similar):
  # notebook() { nix-shell -p 'python3.withPackages (ps: with ps; [ jupyter ])' --run 'jupyter notebook' ; }

  # From #nixos irc channel on freenode:
  # [10:04] <kuznero> What is generally the difference of when I install
  #                   pythong35Packages.jupyter and (python35.withPackages (ps: with ps; [ jupyter ]))?
  #                   The later works, the former does not let me run notebook... Why is that?
  # [10:10] <FRidh> kuznero: the python interpreter looks for modules in the site-packages folder
  # [10:10] <FRidh> with Nix we do not have a shared site-packages folder
  # [10:11] <FRidh> that means we need to somehow tell the i nterpreter where to find modules
  # [10:11] <FRidh> The former just gives you the package, and wraps any executables it may come with,
  #                 whereas the latter wraps the interpreter so that it can find all included modules.
}
