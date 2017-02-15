#!/bin/bash

skip_all=false
overwrite_all=false
backup_all=false

# install base16 colors
if [ ! -d ~/.config/base16-shell ]; then
  git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
fi

for linkable in `ls */**.symlink`
do
  overwrite=false
  backup=false

  file=`basename $linkable | sed s/.symlink//`
  target="$HOME/.$file"

  if [ -e $target ]
  then
    if [ $skip_all != true ] && [ $overwrite_all != true ] && [ $backup_all != true ]
    then
      printf "File already exists: $target, what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all "
      read input

      case $input in
        o )
          overwrite=true
          ;;
        b )
          backup=true
          ;;
        O )
          overwrite_all=true
          ;;
        B )
          backup_all=true
          ;;
        S )
          skip_all=true
          ;;
        s )
          continue
          ;;
      esac
    fi

    if [ $overwrite == true ] || [ $overwrite_all == true ]
    then
      rm $target
    fi

    if [ $backup == true ] || [ $backup_all == true ]
    then
      mv "$HOME/.$file" "$HOME/.$file.backup"
    fi
  fi

  ln -s "$PWD/$linkable" "$target"
done
