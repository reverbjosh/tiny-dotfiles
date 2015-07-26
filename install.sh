#!/bin/bash

skip_all=false
overwrite_all=false
backup_all=false

for linkable in `ls */**.symlink`
do
    overwrite=false
    backup=false

    file=`basename $linkable | sed s/.symlink//`
    target="$HOME/.$file"

    if [ -e $target ] | [ -L $target ]
    then
      if [ skip_all != true ] || [ overwrite_all != true ] || [ backup_all != true ]
      then
        echo "File already exists: $target, what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all"
      fi
    fi
done
