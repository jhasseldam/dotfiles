@echo off
copy /Y .\emacs\.emacs "%APPDATA%"
copy /Y .\emacs\.emacs "%USERPROFILE%"
copy /Y .\git\windows\.gitconfig "%USERPROFILE%"
copy /Y .\haskell\windows\.ghci "%USERPROFILE%"
copy /Y .\vim\.kuvim* "%USERPROFILE%"
copy /Y .\vim\_* "%USERPROFILE%"
copy /Y .\tmux\.tmux* "%USERPROFILE%"
mkdir "%USERPROFILE%\AppData\Roaming\doublecmd"
copy /Y .\doublecmd\* "%USERPROFILE%\AppData\Roaming\doublecmd"
@echo on
