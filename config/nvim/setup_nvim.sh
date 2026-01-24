#!/usr/bin/env bash
. ./install_pkgs.sh
idk neovim npm

read -p "install lazyvim? [Y/n] " ans
if [[ "$ans" != "n" ]] && [[ "$ans" != "N" ]]; then
  if [ -d "$HOME/.config/nvim/" ]; then
    rm -rf "$HOME/.config/nvim/"
  fi

  git clone https://github.com/LazyVim/starter "$HOME/.config/nvim"
  rm -rf "$HOME/.config/nvim/.git"

  mkdir -p "$HOME/.config/nvim/snippets/"
  file=$(find "$(dirname "$0")" -name "*json" -type f)
  cp "$file" "$HOME/.config/nvim/snippets/"
fi
