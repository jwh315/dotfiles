#!/bin/bash

# Get current dir (so run this script from anywhere)

export DOTFILES_DIR EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# symlink configuration files
mkdir -p ~/.config

ln -sf "$DOTFILES_DIR/nvim" ~/.config
ln -sf "$DOTFILES_DIR/kitty" ~/.config
ln -sf "$DOTFILES_DIR/.gitconfig" ~/.gitconfig

# Install Homebrew
. "$DOTFILES_DIR/install/brew.sh"
. "$DOTFILES_DIR/install/npm.sh"


