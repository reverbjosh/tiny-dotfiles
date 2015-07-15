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
    echo $target
done
