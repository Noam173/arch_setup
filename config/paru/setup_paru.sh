file=$(find "$(dirname "$0")" -name *.conf -type f)
mkdir -p "$HOME/.config/paru"
cp "$file" "$HOME/.config/paru"
