#!/bin/bash

#By Troyyy

wallpaper_dir="$(ls ~/wallpaper)"
wallpaper="$HOME/.cache/currentwallpaper.png"

# Show the menu using Rofi

SelectWallpaper() {
    chosen=$(echo -e "$wallpaper_dir" | rofi -dmenu -i -p "Choose a wallpaper:3" -l 17 )
}

RandomWallpaper() {
    chosen=$(echo "$wallpaper_dir" | shuf -n 1 )
}


main() {
    notify-send "setting the wallpaper"
    if [[ -z "$chosen" ]]; then
	    notify-send "you didn't pick any wallpaper"
	    return 1
    else
	    waypaper --wallpaper "$path"  &
	    wal -i "$HOME/wallpaper/$chosen" --saturate 1.0 -n
	    pkill waybar
	    waybar -c ~/.config/waybar/config-sway.jsonc &
	    cp "$HOME/wallpaper/$chosen" $wallpaper
fi
}

if [[ -n $@ ]]; then
	RandomWallpaper
    path="~/wallpaper/$chosen"

	main
else
	SelectWallpaper
    path="~/wallpaper/$chosen"

	main
fi

