#!/bin/bash

# Set the GitHub repository URL
REPO_URL="https://github.com/MihneaTs1/dotfiles/archive/refs/heads/main.zip"
TEMP_DIR="dotfiles-main"
INSTALL_DIR="${HOME}/.config/nvim"

# Allow user to specify a different install path
if [ "$1" ]; then
    INSTALL_DIR="$1"
fi

# Download the repository
echo "Downloading Neovim config template..."
curl -L "$REPO_URL" -o dotfiles.zip

# Extract the ZIP
echo "Extracting files..."
unzip -q dotfiles.zip

# Backup existing Neovim config (if exists)
if [ -d "$INSTALL_DIR" ]; then
    BACKUP_DIR="${INSTALL_DIR}_backup_$(date +%Y%m%d%H%M%S)"
    echo "Backing up existing Neovim config to $BACKUP_DIR..."
    mv "$INSTALL_DIR" "$BACKUP_DIR"
fi

# Copy only the `.config/nvim/` directory
echo "Installing new Neovim config..."
mkdir -p "$(dirname "$INSTALL_DIR")"
cp -r "$TEMP_DIR/.config/nvim" "$INSTALL_DIR"

# Cleanup temporary files
rm -rf dotfiles.zip "$TEMP_DIR"

echo "✅ Installation complete! Neovim config installed at: $INSTALL_DIR"
echo "Run 'nvim' to start Neovim with your new config."
