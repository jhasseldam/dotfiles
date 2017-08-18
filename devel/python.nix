{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    python35Full
    python35Packages.ipykernel
    python35Packages.ipywidgets
    python35Packages.jupyter
    python35Packages.jupyter_client
    python35Packages.jupyter_console
    python35Packages.jupyter_core
    python35Packages.jupyterlab
    python35Packages.nbconvert
    python35Packages.nbformat
    python35Packages.notebook
    python35Packages.qtconsole
    python35Packages.widgetsnbextension
    python35Packages.ipython
    python35Packages.setuptools
    python35Packages.numpy
  ];

  # to start jupyter-notebook, go into nix-shell like this:
  # nix-shell -p 'python3.withPackages (ps: with ps; [ jupyter ])'
  # and then start `jupyter-notebook`
}
