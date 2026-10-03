#!/usr/bin/env bash

sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
paru -S --needed - < packages.txt


set -euo pipefail

DOTFILES="$HOME/.dotfiles"
BACKUP_ROOT="$HOME/.dotfiles-backups"
BACKUP="$BACKUP_ROOT/$(date '+%Y-%m-%d_%H-%M-%S')"

cd "$DOTFILES"

echo "Dotfiles: $DOTFILES"
echo "Backup:   $BACKUP"
echo

find . -type f -not -path './.git/*' -print0 |
while IFS= read -r -d '' file; do
    relative="${file#./}"
    package="${relative%%/*}"
    target="${relative#*/}"

    if [[ -e "$HOME/$target" || -L "$HOME/$target" ]]; then
        mkdir -p "$BACKUP/$(dirname "$target")"

        echo "Backup: $HOME/$target"
        cp -a "$HOME/$target" "$BACKUP/$(dirname "$target")/"

        echo "Remove: $HOME/$target"
        rm -rf "$HOME/$target"
    fi
done

echo
echo "Installing dotfiles..."

stow */

echo
echo "Done."

if [[ -d "$BACKUP" ]]; then
    echo "Backup saved to:"
    echo "  $BACKUP"
fi

