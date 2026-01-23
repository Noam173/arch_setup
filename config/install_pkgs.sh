#!/usr/bin/env bash
package_exist() {
  paru -Qe "$1" >/dev/null 2>&1 || return 1
}
default=("uv" "firefox" "pipewire-pulse" "pavucontrol")
idk() {
  for i in $@; do
    if package_exist "$i"; then
      printf "%s\n" "$i already exists, skipping..."
    else
      echo "installing $i"
      paru -S "$i" --noconfirm
    fi
    sleep 0.1
  done
}
if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
  idk "${default[@]}"
fi
