@echo off
copy /Y .\emacs\.spacemacs "%APPDATA%"
mkdir "%APPDATA%\.emacs.d"
robocopy .\emacs\.emacs.d "%APPDATA%\.emacs.d" /MIR
copy /Y .\git\windows\.gitconfig "%USERPROFILE%"
copy /Y .\vim\.kuvim* "%USERPROFILE%"
copy /Y .\vim\_* "%USERPROFILE%"
copy /Y .\tmux\.tmux* "%USERPROFILE%"
mkdir "%APPDATA%\doublecmd"
copy /Y .\doublecmd\* "%APPDATA%\doublecmd"
@echo on
