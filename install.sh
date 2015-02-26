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
mkdir -p ~/bin
cp -v bash/* ~/bin
echo ""
read -p "Do you want to modify ~/.bash_profile to include new bash extensions? " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo 'if [ -f "$HOME/bin/bashrc.sh" ]; then' >> ~/.bash_profile
  echo '  . "$HOME/bin/bashrc.sh"' >> ~/.bash_profile
  echo 'fi' >> ~/.bash_profile
  echo '. ~/.bash_profile' >> ~/.bashrc
  echo "done."
fi
