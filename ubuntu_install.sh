#!/bin/bash

# Accept branch name as argument, default to "main"
BRANCH=${1:-main}
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "==> Setting up dotfiles on branch: $BRANCH"

# Switch to the specified branch
echo "==> Switching to branch: $BRANCH"
cd "$DOTFILES_DIR"
git checkout "$BRANCH"

# Install required packages
echo "==> Installing packages..."
apt update
apt install -y zsh curl build-essential cmake software-properties-common tmux

# Install newer Neovim (Ubuntu's default is too old for nvim-lspconfig)
echo "==> Installing Neovim (latest stable from PPA)..."
# Always install from unstable PPA to ensure we get Neovim 0.11+
add-apt-repository -y ppa:neovim-ppa/unstable
apt update
apt install -y neovim

# Verify version
echo "==> Neovim version: $(nvim --version | head -n1)"

# Install oh-my-zsh if not already installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "==> Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Create symlinks for zsh configuration
echo "==> Setting up zsh symlinks..."
ln -sf "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"

# Create symlink for tmux configuration
echo "==> Setting up tmux symlinks..."
ln -sf "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"

# Create symlink for neovim configuration
echo "==> Setting up neovim configuration..."
mkdir -p "$HOME/.config"
ln -sf "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"

# Install Packer plugin manager for neovim
echo "==> Installing Packer plugin manager..."
mkdir -p "$HOME/.local/share/nvim/site/pack/packer/start"
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
    "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"

# Change default shell to zsh
if [ "$SHELL" != "$(which zsh)" ]; then
    echo "==> Changing default shell to zsh..."
    chsh -s $(which zsh)
fi

echo ""
echo "==> Setup complete! Current branch: $BRANCH"
echo "==> Please log out and log back in for the shell change to take effect."
echo "==> Or run: exec zsh"
echo ""
echo "==> Execute :PackerSync first time after launching nvim and then restart."
