alias emd="emacs --daemon"
alias emk="emacsclient -e '(kill-emacs)'"
alias emt="emacsclient -t"
alias em="emacsclient -c"
PROMPT='
%{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info) @ %{$fg_bold[red]%}%*%{$reset_color%} <%{$fg_bold[blue]%}docker-host:%{$reset_color%} %{$fg_bold[yellow]%}${DOCKER_HOST-local}%{$reset_color%}>
$ '
