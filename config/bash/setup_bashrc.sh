file=$(find "$(dirname "$0")" -name .bashrc -type f)
cp "$file" "$HOME"
