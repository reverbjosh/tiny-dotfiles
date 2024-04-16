#!/bin/bash
set -eu

# determine install prefix
# also opportunistically install ag since pkg names differ
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)
      install () {
        echo "installing $1"
        sudo apt-get install $1
      }
      install silversearcher-ag;;
    Darwin*)
      install () {
        echo "installing $1"
        brew install $1
      }
      install the_silver_searcher;;
esac

# install libs
install zsh
install tmux
install autojump
install direnv
install nvim

# install oh-my-zsh
echo "installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# link (n)vim directory
ln -s ~/.dotfiles/vim ~/.vim
mkdir -p ~/.config/nvim
ln -s ~/.dotfiles/nvim.init.vim ~/.config/nvim/init.vim

# install vim plug
 curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install nvim plug
 sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
