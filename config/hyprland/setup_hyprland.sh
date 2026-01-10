echo "running hyprland setup"
. "$(dirname "$(dirname "$0")")/install_pkgs.sh"
file=$(find "$(dirname "$0")" -name "*.conf" -type f)
mkdir -p "$HOME/.config/hypr/"
cp "$file" "$HOME/.config/hypr/"
idk "hyprland" "xdg-desktop-portal-hyprland" "slurp" "grim" "wl-clipboard"
