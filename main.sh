#!/usr/bin/env bash

cwd="$PWD"
check_command() {
  command -v "$1" >/dev/null 2>&1 || return 1
}

neccesary() {
  mkdir -p "$HOME/.config"
  if check_command pipewire-pulse; then
    sudo systemctl enable pipewire-pulse --now >/dev/null 2>&1
  fi
  #  zed_install
}

scripts() {
  cd "$(find "$(dirname "$0")" -name "config" -type d)"
  for dir in $(find . -maxdepth 1 -type d); do
    $(find "$dir" -name "*.sh")
  done
  cd "$cwd"
}

zed_install() {
  if ! check_command zeditor; then
    paru -S zed --noconfirm
  fi
  if [ -d "$HOME/.config/zed/" ]; then
    rm -rf "$HOME/.config/zed/"
  fi
  git clone https://github.com/noam173/zed "$HOME/.config/zed/"
}

git_cred() {
  if [ ! -f "$HOME/.git-credentials" ]; then
    echo "https://<username>:<token>@github.com" >"$HOME/.git-credentials"
  fi
  git config --global credential.helper store
}

clearSource() {
  if [[ -d /tmp ]]; then
    sudo rm -rf tmp/*
  fi
  if [[ -d /var/tmp ]]; then
    sudo rm -rf /var/tmp/*
  fi
  paru -Rns "$(paru -Qtdq)" --noconfirm >/dev/null || true
  clear
  source ~/.bashrc
}

paru_install() {
  if ! check_command paru; then
    git clone https://aur.archlinux.org/paru.git "$HOME/paru"
    cd "$HOME/paru"
    makepkg -si --noconfirm
  fi
  cd $cwd
  rm -rf "$HOME/paru/"
}

paru_install
neccesary
scripts
git_cred
clearSource

read -p "reboot? [Y/n] " ans
if [[ "$ans" != "n" ]] && [[ "$ans" != "N" ]]; then
  reboot
fi
