#!/usr/bin/env bash
printf "%s\n" "paru already exists, skipping.."
file=$(find "$(dirname "$0")" -name *.conf -type f)
mkdir -p "$HOME/.config/paru"
cp "$file" "$HOME/.config/paru"
