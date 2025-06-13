#!/bin/sh

N=$(checkupdates | wc -l)
NT=$(yay -Qua | wc -l)

echo $((N+NT))
