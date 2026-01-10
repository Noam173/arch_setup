file=$(find "$(dirname $0)" -name *.conf -type f)
mkdir -p "$HOME/.config/hypr/"
cp $file "$HOME/.config/hypr/"
