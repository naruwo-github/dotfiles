#!/bin/bash

# Installation script for dotfiles
echo "Starting dotfiles setup..."

# Error handling
# NOTE: 失敗の早期検知と未定義変数の防止に `set -euo pipefail` を検討
set -euo pipefail

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
# NOTE: ディレクトリ移動は `zoxide` + `fzf` の組み合わせも候補
brew install peco

# Install mise
# NOTE: パイプインストールはハッシュ固定や検証のない取得となる点に留意
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
