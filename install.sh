#!env bash

git submodule update --init --recursive

echo ""
echo -e "\e[40;38;5;82m PROCESSING \e[30;48;5;82m GIT \e[0m"
echo ""
cp -v git/.gitconfig $HOME

echo ""
echo -e "\e[40;38;5;82m PROCESSING \e[30;48;5;82m VIM \e[0m"
echo ""
cp -v vim/.ku* $HOME
cp -v vim/.vimrc $HOME

echo ""
echo -e "\e[40;38;5;82m PROCESSING \e[30;48;5;82m EMACS \e[0m"
echo ""
rm $HOME/.emacs
cp -v emacs/.spacemacs $HOME
echo ""
read -p "Do you want to reset your SPACEMACS setup? " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
  rm -rf $HOME/.emacs.d/
  cp -vr emacs/.emacs.d $HOME
fi

echo ""
echo -e "\e[40;38;5;82m PROCESSING \e[30;48;5;82m TMUX \e[0m"
echo ""
cp -v tmux/.tmux.conf $HOME

#echo ""
#echo -e "\e[40;38;5;82m PROCESSING \e[30;48;5;82m DOUBLE CMD \e[0m"
#echo ""
#mkdir -p $HOME/.config/doublecmd
#cp -v doublecmd/*.xml $HOME/.config/doublecmd

echo ""
echo -e "\e[40;38;5;82m PROCESSING \e[30;48;5;82m SYNAPSE \e[0m"
echo ""
mkdir -p $HOME/.config/synapse
cp -v synapse/*.json $HOME/.config/synapse

#echo ""
#echo -e "\e[40;38;5;82m PROCESSING \e[30;48;5;82m SUBLIME TEXT 3 \e[0m"
#echo ""
#mkdir -p $HOME/.config/sublime-text-3/Packages/User
#cp -v sublime/.config/sublime-text-3/Packages/User/Preferences.sublime-settings $HOME/.config/sublime-text-3/Packages/User

echo ""
echo -e "\e[40;38;5;82m PROCESSING \e[30;48;5;82m ZSH SCRIPTS \e[0m"
echo ""
read -p "Do you want to install oh-my-zsh? " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
  rm -rf ~/.oh-my-zsh/
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  cp -v zsh/.zshrc $HOME
fi

echo ""
echo -e "\e[40;38;5;82m PROCESSING \e[30;48;5;82m BASH SCRIPTS \e[0m"
echo ""
mkdir -p $HOME/bin
cp -rv bash/* $HOME/bin
find bash/ -type l -exec cp -av {} $HOME/bin \;
cp -v bash/.inputrc $HOME

echo ""
echo -e "\e[40;38;5;82m PROCESSING \e[30;48;5;82m BASH EXTENSIONS \e[0m"
echo ""
cp -v bash/.kuprofile $HOME
echo ""
read -p "Do you want to modify $HOME/.bash_profile and $HOME/.bashrc to include new extensions? " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo '' >> $HOME/.bash_profile
  echo 'if [ -f "$HOME/.kuprofile" ]; then' >> $HOME/.bash_profile
  echo '  . "$HOME/.kuprofile"' >> $HOME/.bash_profile
  echo 'fi' >> $HOME/.bash_profile
  echo '' >> $HOME/.bash_profile
  echo '' >> $HOME/.bashrc
  echo 'if [ -f "$HOME/.kuprofile" ]; then' >> $HOME/.bashrc
  echo '  . "$HOME/.kuprofile"' >> $HOME/.bashrc
  echo 'fi' >> $HOME/.bashrc
  echo "done."
  echo '' >> $HOME/.bashrc
fi
