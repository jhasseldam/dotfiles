@echo off
copy /Y .\git\windows\.gitconfig "%USERPROFILE%"
copy /Y .\haskell\windows\.ghci "%USERPROFILE%"
copy /Y .\vim\.kuvim* "%USERPROFILE%"
copy /Y .\vim\_* "%USERPROFILE%"
@echo on
