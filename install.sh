#!/bin/bash

# Installation script for dotfiles
echo "Starting dotfiles setup..."

# Error handling
set -e

# Install required packages
echo "Installing required packages..."

# Install Homebrew if not exists
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install packages via Homebrew
echo "Installing packages via Homebrew..."
brew install starship
brew install eza
brew install lazygit
brew install lazydocker
brew install peco

# Install mise
echo "Installing mise..."
curl https://mise.run | sh

# Create backup directory
BACKUP_DIR="$HOME/.dotfiles_backup/$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

# Backup existing files
backup_if_exists() {
    if [ -f "$1" ] || [ -L "$1" ]; then
        echo "Backing up $1"
        mv "$1" "$BACKUP_DIR/"
    fi
}

# Backup existing files
backup_if_exists ~/.vimrc
backup_if_exists ~/.zprofile
backup_if_exists ~/.zshrc
backup_if_exists ~/.alias_profile
backup_if_exists ~/.config/starship.toml

# Create symbolic links
echo "Creating symbolic links..."
ln -s "$(pwd)/vim-setting/.vimrc" ~/.vimrc
ln -s "$(pwd)/zsh-setting/.zprofile" ~/.zprofile
ln -s "$(pwd)/zsh-setting/.zshrc" ~/.zshrc
ln -s "$(pwd)/zsh-setting/.alias_profile" ~/.alias_profile
ln -s "$(pwd)/starship.toml" ~/.config/starship.toml

echo "Setup completed successfully!" 