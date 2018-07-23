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

# install oh-my-zsh
echo "installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


# instructions for setting base16 colors because we can't run them programtically
echo ""
echo ""
echo ""
echo "Done installing utils!"
echo ""
echo "Run 'base16_railscasts' to set shell theme"
