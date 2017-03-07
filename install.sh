#!/bin/bash

DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/dotfiles_bkp"
DOTFILES="bash_aliases gitconfig vimrc Xdefaults xsessionrc"

mkdir -p $BACKUP_DIR 
cd $DIR

for file in $DOTFILES; do
  mv "$HOME/.$file" "$BACKUP_DIR"
  ln -s "$DIR/$file" "$HOME/.$file"
done

for file in $(ls "$DIR/atom"); do
  ln -s "$DIR/atom/$file" "$HOME/.atom/$file"
done

ln -s "$DIR/i3/config" "$HOME/.config/i3/config"

for file in $(ls "$DIR/utils"); do
  ln -s "$DIR/utils/$file" "$HOME/utils/$file"
done
