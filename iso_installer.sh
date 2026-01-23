#!/usr/bin/env bash

out_file="arch.iso"
url="https://archlinux.interhost.co.il/iso/latest/archlinux-x86_64.iso"
if [ -f $out_file ]; then
  rm -rf $out_file
fi
if [ -f /usr/bin/wget ]; then
  wget $url -O $out_file
else
  curl $url -o $out_file
fi
echo "Date of iso is $(date +"01/%m/%y")"
