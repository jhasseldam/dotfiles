@echo off
copy /Y .\emacs\.emacs "%APPDATA%"
copy /Y .\git\windows\.gitconfig "%USERPROFILE%"
copy /Y .\haskell\windows\.ghci "%USERPROFILE%"
copy /Y .\vim\.kuvim* "%USERPROFILE%"
copy /Y .\vim\_* "%USERPROFILE%"
copy /Y .\tmux\.tmux* "%USERPROFILE%"
@echo on
