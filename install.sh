#!/bin/bash

for f in .??*
do
    [[ "$f" == ".git" ]] && continue

    echo "$f"
    ln -s "$HOME/dotfiles/$f" "$HOME/$f"
done
