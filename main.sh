#!/usr/bin/env bash

cwd="$PWD"

check_command() {
    command -v $1 >/dev/null 2>&1 || return 1
}

neccesary() {
    sudo chown -R $USER:$USER ~/.config
    pkgs=("neovim" "uv" "waybar" "wofi" "firefox" "hyprland" "xdg-desktop-portal-hyprland" "slurp" "grim" "wl-clipboard" "kitty" "ttf-meslo-nerd" "pipewire-pulse" "pavucontrol")
    for i in $pkgs;do
        if ! check_command "$i"; then
            sudo paru -S "$i" --noconfirm
        fi
    done
    if check_command pipewire-pulse; then
        sudo systemctl enable pipewire-pulse --now
    fi
}


scripts() {
    files="$(find "$(dirname "$0")" -name 'setup*')"
    for script in $files;do
    uv run "$script"
    done
}


zed_install() {
    if ! check_command zeditor; then
        paru -S zed --noconfirm
    fi
    if [ -f "$HOME/.config/zed/" ]; then
        rm -rf "$HOME/.config/zed/"
    fi
    git clone https://github.com/noam173/zed "$HOME/.config/zed/"
}


git_cred() {
    if [ ! -f "$HOME/.git-credentials" ]; then
        echo "https://<username>:<token>@github.com" > "$HOME/.git-credentials"
    fi
    git config --global credential.helper store
}


clearSource() {
    sudo rm -rf /tmp/* /var/tmp/* /var/log/*.log
    paru -Rns $(paru -Qtdq) --noconfirm > /dev/null || true
    if [ -f "$HOME/.bashrc" ]; then
        clear && source "$HOME/.bashrc"
    fi
}


paru_install() {
    if ! check_command paru; then
        git clone https://aur.archlinux.org/paru.git
        cd paru
        makepkg -si --noconfirm
    fi
    cd "$cwd"
}

paru_install
neccesary
scripts
zed_install
git_cred
clearSource


rm -rf "$HOME/tmp"
echo "reboot? [Y/n]"
read -r ans
if [[ "$ans" != "n" && "$ans" != "N" ]]; then

reboot

fi
