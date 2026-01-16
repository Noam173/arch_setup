echo "running nvim setup"
. "$(dirname "$(dirname "$0")")/install_pkgs.sh"
idk neovim

if [ -d "$HOME/.config/nvim/" ]; then
  rm -rf "$HOME/.config/nvim/"
fi

git clone https://github.com/LazyVim/starter "$HOME/.config/nvim"
rm -rf "$HOME/.config/nvim/.git"

mkdir -p "$HOME/.config/nvim/snippets/"
file=$(find "$(dirname "$0")" -name "*json" -type f)
cp "$file" "$HOME/.config/nvim/snippets/"

files=$(find "$(dirname "$0")" -name "*lua" -type f)

mkdir -p "$HOME/.config/nvim/lua/plugins/"

for i in $files; do
  cp "$i" "$HOME/.config/nvim/lua/plugins"
done
