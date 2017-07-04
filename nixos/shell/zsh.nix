{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    oh-my-zsh
    zsh
  ];

  # shell
  programs.zsh.enable = true;
  users.defaultUserShell = "/run/current-system/sw/bin/zsh";

  programs.zsh.interactiveShellInit = ''
    export PATH="$PATH:$HOME/.local/bin:$HOME/.scripts"
    export ZSH=${pkgs.oh-my-zsh}/share/oh-my-zsh/
    # Customize your oh-my-zsh options here
    ZSH_THEME="afowler"
    export EDITOR='vim'
    export VISUAL='vim'
    HISTFILE=$HOME/.zhistory
    # setopt sharehistory
    setopt extendedhistory
    plugins=(git)
    source $ZSH/oh-my-zsh.sh
    source /etc/nixos/dotfiles/.bashrc
    source $HOME/.scripts/ssh-start.sh
    alias za="$HOME/.scripts/za.sh"
    alias zc="$HOME/.scripts/zc.sh"
    alias zl="$HOME/.scripts/zl.sh"
    alias zr="$HOME/.scripts/zr.sh"
    zz () { root=$("$HOME/.scripts/zz.sh" "$1") && cd "$root" }
  '';

  programs.zsh.promptInit = ""; # Clear this to avoid a conflict with oh-my-zsh
}
