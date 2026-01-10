#!/usr/bin/env bash

cwd="$PWD"
check_command() {
  command -v "$1" >/dev/null 2>&1 || return 1
}

neccesary() {
  mkdir -p "$HOME/.config"
  if check_command pipewire-pulse; then
    sudo systemctl enable pipewire-pulse --now >/dev/null || true
  fi
  zed_install
}

scripts() {
  dir="$(find "$(dirname "$0")" -name "config" -type d)"
  cd "$dir" || exit
  files=$(find . -name "*.sh" -type f)
  for script in ${files[@]}; do
    $script
  done
  cd "$cwd" || exit
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
  sudo rm -rf /tmp/* /var/tmp/* /var/log/*.log
  paru -Rns "$(paru -Qtdq)" --noconfirm > /dev/null || true
  clear; source ~/.bashrc
}

paru_install() {
  if ! check_command paru; then
    git clone https://aur.archlinux.org/paru.git
    cd paru || exit
    makepkg -si --noconfirm
  fi
  cd "$cwd" || exit
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
