files="$(find "$(dirname "$0")" -not -name *.sh -type f)"
mkdir -p "$HOME/.config/wofi"
for i in "${files[@]}"; do
  cp "$i" "$HOME/.config/wofi"
done
