#!/bin/bash

DOTFILES_DIR="$HOME/.dotfiles"
STOW_CMD="stow"

# Ensure GNU Stow is installed
if ! command -v $STOW_CMD &>/dev/null; then
    echo "Error: GNU Stow is not installed. Install it with: sudo apt install stow (Debian/Ubuntu) or sudo pacman -S stow (Arch)"
    exit 1
fi

# Change to dotfiles directory
cd "$DOTFILES_DIR" || { echo "Error: .dotfiles directory not found!"; exit 1; }

echo "🔄 Cleaning up existing dotfiles..."
for dir in */; do
    dir=${dir%/}  # Remove trailing slash
    echo "Unstowing $dir..."
    stow -D "$dir"
done

# Now, re-stow all directories
echo "🚀 Stowing fresh dotfiles..."
for dir in */; do
    dir=${dir%/}  # Remove trailing slash
    echo "Stowing $dir..."
    stow -R "$dir"
done

echo "✅ Dotfiles have been cleaned and stowed successfully."

