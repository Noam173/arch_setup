#!/usr/bin/env bash
if [[ -f /usr/bin/git ]]; then
  sudo pacman -S git --noconfirm
fi
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty* ]]; then
  file_name="./server-setup.sh"
  git clone https://github.com/ChrisTitusTech/linutil
  cd linutil/core/tabs/system-setup/arch/ || exit
  $file_name
fi
