#!/bin/bash

# Exit on error
set -e

# TODO: Starship install... Rust install...

# Update system
echo "Updating system..."
sudo dnf update -y

# Install basic tools
echo "Installing required packages..."
sudo dnf install -y \
  ripgrep \
  fzf \
  neovim \
  eza \
  gcc \

# Install Homebrew (Linux version)
if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew is already installed."
fi

# Install LazyGit (git TUI)
if ! command -v lazygit &>/dev/null; then
  echo "Installing LazyGit..."
  brew install lazygit
else
  echo "LazyGit is already installed."
fi


# Install Zig using Homebrew (as it might not be in Fedora repos)
if ! command -v zig &>/dev/null; then
  echo "Installing Zig using Homebrew..."
  brew install zig
else
  echo "Zig is already installed."
fi

# Install Starship (prompt)
if ! command -v starship &>/dev/null; then
  echo "Installing Starship..."
  curl -sS https://starship.rs/install.sh | sh # This does not work I think..
else
  echo "Starship is already installed."
fi

# Install Z (smarter cd)
if ! command -v z &>/dev/null; then
  echo "Installing Z..."
  curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
else
  echo "Z is already installed."
fi


# Install diffnav
if ! command -v diffnav &>/dev/null; then
  echo "Installing DiffNav..."
  brew install dlvhdr/formulae/diffnav
else
  echo "DiffNav is already installed."
fi

echo "Installation complete!"

