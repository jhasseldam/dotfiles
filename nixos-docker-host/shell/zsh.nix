{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    oh-my-zsh acpi
    zsh
  ];

  # shell
  programs.zsh.enable = true;
  users.defaultUserShell = "/run/current-system/sw/bin/zsh";

  programs.zsh.interactiveShellInit = ''
    export PATH="$PATH:$HOME/.local/bin"
    export ZSH=${pkgs.oh-my-zsh}/share/oh-my-zsh/
    # Customize your oh-my-zsh options here
    ZSH_THEME="amuse"
    export EDITOR='vim'
    export VISUAL='vim'
    HISTFILE=~/.zhistory
    # setopt sharehistory
    setopt extendedhistory
    plugins=(git)
    source $ZSH/oh-my-zsh.sh
  '';

  programs.zsh.promptInit = ""; # Clear this to avoid a conflict with oh-my-zsh
}
