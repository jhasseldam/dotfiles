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
    python35Packages.numpy
  ];
}
