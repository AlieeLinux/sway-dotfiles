#!/usr/bin/bash

SWAYEXIST=false

Copy() {
    mkdir -p "$HOME/dotfiles"
    cp -rvf "*" "$HOME/dotfiles/"
}

Test() {
    for item in $HOME/.config/sway; do
        SWAYEXIST=true
    done
}



Linker() {
    ln ./sway/* ~/.config/sway
}

Test





if [[ $SWAYEXIST == true ]]; then
    echo exist!
fi
