@echo off
copy /Y .\git\windows\.gitconfig "%USERPROFILE%"
copy /Y .\haskell\windows\.ghci "%USERPROFILE%"
copy /Y .\vim\windows\* "%USERPROFILE%"
@echo on
