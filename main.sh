#!/usr/bin/env bash

cwd="$PWD"
check_command() {
    command -v $1 >/dev/null 2>&1 || return 1
}
package_exist() {
    paru -Qe $1 >/dev/null 2>&1 || return 1
}


neccesary() {
    mkdir -p "$HOME/.config"
    pkgs=("neovim" "uv" "firefox" "slurp" "grim" "wl-clipboard" "pipewire-pulse" "pavucontrol")
    for i in $pkgs;do
        if ! package_exist "$i"; then
            paru -S "$i" --noconfirm
        fi
    done
    if check_command pipewire-pulse; then
        sudo systemctl enable pipewire-pulse --now > /dev/null || true
    fi
    zed_install
}


scripts() {
    dir=$(find "$(dirname "$0")" -name "config" -type d)
    cd $dir
    files=$(find -name "*.sh" -type f)
    pkgs=("fastfetch" "bat" "hyprland" "xdg-desktop-portal-hyprland" "kitty" "ttf-meslo-nerd" "waybar" "wofi")
    for script in $files; do
        $script
    done
    for i in $pkgs; do
        if ! package_exist $i; then
            paru -S $i --noconfirm
        fi
    done
    cd $cwd
}


zed_install() {
    if ! package_exist zed; then
        paru -S zed --noconfirm
    fi
    if [ -d "$HOME/.config/zed/" ]; then
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


#paru_install
#neccesary
scripts
#git_cred
#clearSource

#echo "reboot? [Y/n]"
#read -r ans
#if [[ "$ans" != "n" && "$ans" != "N" ]]; then
#    reboot
#fi
