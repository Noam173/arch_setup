package_exist() {
  paru -Qe "$1" >/dev/null 2>&1 || return 1
}
default=("uv" "firefox" "pipewire-pulse" "pavucontrol")
idk() {
  for i in $@; do
    if ! package_exist "$i"; then
      paru -S "$i" --noconfirm
    fi
  done
}
idk "${default[@]}"
