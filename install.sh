#!/bin/bash

echo ""
echo -e "\e[40;38;5;82m PROCESSING \e[30;48;5;82m GIT \e[0m"
echo ""
cp -v git/linux/.gitconfig ~/

echo ""
echo -e "\e[40;38;5;82m PROCESSING \e[30;48;5;82m HASKELL \e[0m"
echo ""
cp -v haskell/linux/.ghci ~/

echo ""
echo -e "\e[40;38;5;82m PROCESSING \e[30;48;5;82m VIM \e[0m"
echo ""
cp -v vim/linux/.* ~/

echo ""
echo -e "\e[40;38;5;82m PROCESSING \e[30;48;5;82m BASH EXTENSIONS \e[0m"
echo ""
cp -v bash/.kuprofile ~/
echo ""
read -p "Do you want to modify ~/.bash_profile and ~/.bashrc to include new extensions? " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo 'if [ -f "$HOME/.kuprofile" ]; then' >> ~/.bash_profile
  echo '  . "$HOME/.kuprofile"' >> ~/.bash_profile
  echo 'fi' >> ~/.bash_profile
  echo 'if [ -f "$HOME/.kuprofile" ]; then' >> ~/.bashrc
  echo '  . "$HOME/.kuprofile"' >> ~/.bashrc
  echo 'fi' >> ~/.bashrc
  echo "done."
fi
