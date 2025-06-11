#!/usr/bin/bash

MakeDotfile() { if ! mkdir ~/dotfiles; then echo "file exists" && cp -r -- * "$HOME/dotfiles"; else cp -r -- * "$HOME/dotfiles";  fi }

SWAYEXIST=false

Copy() {
    mkdir -p "$HOME/dotfiles"
    cp -rvf "*" "$HOME/dotfiles/"
}

Test() {
    if ls "$HOME/.config/sway"; then
        SWAYEXIST=true
    fi
}

Linking() { 
        find "*" -type d -exec mkdir "$HOME/.config/{}" \; -exec ln "./{}/*" "$HOME/.config/{}/*" \;
#    for i in $(/bin/ls); do
#        mkdir ~/.config/"$i" && ln -s ~/.config/"$i"/* 
#        ln "/*$i" ~/.config/"$i"/
#    done 
}

Test



if [[ $SWAYEXIST == true ]]; then
    echo exist!
fi
