#!/usr/bin/bash

MakeDotfile() { if ! mkdir ~/dotfiles; then echo "file exists" && cp -r -- * "$HOME/dotfiles"; else cp -r -- * "$HOME/dotfiles";  fi }

SWAYEXIST=false

PreCreate() {
    wal -i ./meme.png
}

FixLinkings() {
    ln -sf ~/.cache/wal/colors-waybar.css ~/.config/waybar/colors.css
    ln -sf ~/.cache/wal/colors-waybar.css ~/.config/swaync/colors.css
}

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
    find -- * -type d -exec mkdir "$HOME/.config/{}" \;
	find -- * -type d  -exec sh -c "ln -f ./{}/* $HOME/.config/{}/" \;
    FixLinkings
    #find "*" -type d -exec mkdir "$HOME/.config/{}" -exec ln "./{}/*" "$HOME/.config/{}/*" \;

}

Test
Linking


if [[ $SWAYEXIST == true ]]; then
    echo exist!
fi
