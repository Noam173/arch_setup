echo "running wofi setup"
. "$(dirname "$(dirname "$0")")/install_pkgs.sh"
files="$(find "$(dirname "$0")" -not -name *.sh -type f)"
mkdir -p "$HOME/.config/wofi"
for i in $files; do
  cp "$i" "$HOME/.config/wofi"
done
idk wofi
