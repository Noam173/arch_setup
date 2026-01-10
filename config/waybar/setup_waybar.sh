. ../install_pkgs.sh
files=$(find "$(dirname "$0")" -not -name "*.sh" -type f)
mkdir -p "$HOME/.config/waybar"
for i in "${files[@]}"; do
  cp "$i" "$HOME/.config/waybar"
done
idk "waybar"
