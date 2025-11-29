#!/usr/bin/env python

from glob import glob
from pathlib import Path
from subprocess import run


def main() -> None:
    run("sudo chown -R $USER:$USER ~/.config", shell=True, check=True)
    run("sudo pacman -S uv --noconfirm",shell=True,check=True)
    files: list[str] = glob(f"{Path(__file__).parent}/stuff/*/setup*")
    for i in files:
        run(f"python {i}", shell=True, check=True)
    run(f"clear && source {Path.home()}/.bashrc", shell=True, check=True)
    print("\nthe paru config was copyied to .config, please install paru from linutil\n")
    q1: str = input("launch linutil? [y/N] \n")
    if q1.lower() == 'y':
        run("curl -fsSL https://christitus.com/linux | sh", shell=True, check=True)
    q2: str = input("launch hyprland? [Y/n] \n")
    if q2.lower() != "n":
        run("hyprland", shell=True, check=True)



if __name__ == '__main__':
    main()
