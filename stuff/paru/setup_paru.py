from glob import glob
from pathlib import Path
from shutil import copy
from subprocess import run


def main() -> None:
    path: Path = Path.home() / ".config" / "paru"
    path.mkdir(parents=True, exist_ok=True)
    idk: Path = Path(__file__).parent
    copy(src=f"{idk}/paru.conf",dst=path)

if __name__ == '__main__':
    main()
