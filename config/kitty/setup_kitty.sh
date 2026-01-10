echo "running kitty setup"
. "$(dirname "$(dirname "$0")")/install_pkgs.sh"
files=$(find "$(dirname "$0")" -not -name "*.sh" -type f)
mkdir -p "$HOME/.config/kitty"
for i in $files; do
  cp "$i" "$HOME/.config/kitty"
done
idk "kitty" "ttf-meslo-nerd"
