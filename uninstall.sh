#!/bin/bash

for linkable in `ls **.symlink`
do
  file=`basename $linkable | sed s/.symlink//`
  target="$HOME/.$file"

  # remove all symlinks created during installation
  if [ -L $target ]
  then
    rm $target
  fi

  # replace any backups made during installation
  if [ -e "$HOME/.$file.backup" ]
  then
    mv "$HOME/.$file.backup" "$HOME/.$file"
  fi
done
