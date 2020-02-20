# jshou does dotfiles

## install

- `git clone git@github.com:jshou/dotfiles.git ~/.dotfiles`
- `cd ~/.dotfiles`
- `./install.sh`
- `./dependencies.sh`

The install script will symlink the appropriate files in `.dotfiles` to your
home directory. Everything is configured and tweaked within `~/.dotfiles`,
though.

`dependencies.sh` will install libs and utils that I like. It expects
`install.sh` to have been run already.

## topical

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Java" — you can simply add a `java` directory and put
files in there. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `./install.sh`.


## thanks

I forked [Zach Holman](http://github.com/holman)'s excellent
[dotfiles](http://github.com/holman/dotfiles) but eventually modified it to fit
my own needs.
