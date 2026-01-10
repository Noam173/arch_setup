. ../install_pkgs.sh
files=$(find "$(dirname "$0")" -not -name "*lua" -type f)
mkdir -p "$HOME/.config/nvim/lua/plugins/"
for i in "${files[@]}"; do
  cp "$i" "$HOME/.config/nvim/lua/plugins"
done
idk neovim
