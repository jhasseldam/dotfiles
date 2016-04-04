#!/bin/bash

echo ""
echo -e "\e[40;38;5;82m PROCESSING \e[30;48;5;82m GIT \e[0m"
echo ""
cp -v git/linux/.gitconfig $HOME

echo ""
echo -e "\e[40;38;5;82m PROCESSING \e[30;48;5;82m HASKELL \e[0m"
echo ""
cp -v haskell/linux/.ghci $HOME

echo ""
echo -e "\e[40;38;5;82m PROCESSING \e[30;48;5;82m VIM \e[0m"
echo ""
cp -v vim/.* $HOME

echo ""
echo -e "\e[40;38;5;82m PROCESSING \e[30;48;5;82m TMUX \e[0m"
echo ""
cp -v tmux/.* $HOME

echo ""
echo -e "\e[40;38;5;82m PROCESSING \e[30;48;5;82m BASH EXTENSIONS \e[0m"
echo ""
cp -v bash/.kuprofile $HOME
echo ""
read -p "Do you want to modify $HOME/.bash_profile and $HOME/.bashrc to include new extensions? " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo 'if [ -f "$HOME/.kuprofile" ]; then' >> $HOME/.bash_profile
  echo '  . "$HOME/.kuprofile"' >> $HOME/.bash_profile
  echo 'fi' >> $HOME/.bash_profile
  echo 'if [ -f "$HOME/.kuprofile" ]; then' >> $HOME/.bashrc
  echo '  . "$HOME/.kuprofile"' >> $HOME/.bashrc
  echo 'fi' >> $HOME/.bashrc
  echo "done."
fi
