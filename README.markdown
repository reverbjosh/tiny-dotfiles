# jshou does dotfiles

## install

- `git clone git://github.com/jshou/dotfiles ~/.dotfiles`
- `cd ~/.dotfiles`
- `./install.sh`

The install script will symlink the appropriate files in `.dotfiles` to your
home directory. Everything is configured and tweaked within `~/.dotfiles`,
though.

The main file you'll want to change right off the bat is `zsh/zshrc.symlink`,
which sets up a few paths that'll be different on your particular machine.

## topical

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Java" — you can simply add a `java` directory and put
files in there. Anything with an extension of `.zsh` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `./install.sh`.


## thanks

I forked [Zach Holman](http://github.com/holman)'s excellent
[dotfiles](http://github.com/holman/dotfiles) but eventually modified it to fit
my own needs.
