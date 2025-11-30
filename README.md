#!/usr/bin/env bash

# main.py has a shbeng line (#!/usr/bin/env python) and the neccesary permissions so it can be run ./main.py

# run:

cd $(find $HOME -name "hyprland_setup")

uvx pyinstaller hyprland.py \
 --add-data "stuff:stuff" \
 --onefile \
 --distpath "$HOME/setup"

rm -rf build/ hyprland.spec
