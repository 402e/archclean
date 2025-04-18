# archclean

**archclean** is a simple Zsh script to help you clean up your Arch Linux–based system.

It removes orphaned packages, clears the pacman cache, shows manually installed packages, and optionally cleans up orphaned AUR packages using `yay`.

---

## Features

- Removes orphaned packages from the official repos (`pacman -Qdtq`)
- Cleans up the pacman package cache (`paccache -r -k1`)
- Displays manually installed packages (`pacman -Qent`)
- Optionally removes orphaned AUR packages (`yay -Yq --orphans`)

---

## Requirements

This script requires the following dependencies:

- **Zsh** (the script is written for Zsh)
- **yay** (for cleaning orphaned AUR packages)
- **pacman-contrib** (provides `paccache` for cache cleanup)

To install the dependencies:

```bash
sudo pacman -S zsh yay pacman-contrib
