#!/bin/bash

# Neovim Easy Configuration Remote Installer
# Usage: curl -fsSL https://raw.githubusercontent.com/norandom/nvim-simple/main/install.sh | bash

set -e

echo "Installing Neovim Easy Configuration..."

# Check if nvim is installed
if ! command -v nvim &> /dev/null; then
    echo "Neovim is not installed. Please install Neovim first."
    echo "   Ubuntu/Debian: sudo apt install neovim"
    echo "   macOS: brew install neovim"
    echo "   Other: https://github.com/neovim/neovim/wiki/Installing-Neovim"
    exit 1
fi

# Backup existing config if it exists
if [ -d ~/.config/nvim ]; then
    echo "Backing up existing Neovim configuration..."
    mv ~/.config/nvim ~/.config/nvim.backup.$(date +%Y%m%d_%H%M%S)
    echo "   Backup saved to ~/.config/nvim.backup.$(date +%Y%m%d_%H%M%S)"
fi

# Create nvim config directory
echo "Creating Neovim configuration directory..."
mkdir -p ~/.config/nvim/colors
mkdir -p ~/.config/nvim/lua

# Check if running from local repo
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [ -f "$SCRIPT_DIR/nvim/init.vim" ]; then
    echo "Installing from local repository..."
    
    echo "   Copying init.vim..."
    cp "$SCRIPT_DIR/nvim/init.vim" ~/.config/nvim/init.vim
    
    echo "   Copying Berg colorscheme..."
    cp "$SCRIPT_DIR/nvim/colors/berg.vim" ~/.config/nvim/colors/berg.vim
    cp "$SCRIPT_DIR/nvim/colors/berg-light.vim" ~/.config/nvim/colors/berg-light.vim
    cp "$SCRIPT_DIR/nvim/lua/berg.lua" ~/.config/nvim/lua/berg.lua
    cp "$SCRIPT_DIR/nvim/lua/berg-light.lua" ~/.config/nvim/lua/berg-light.lua
else
    # Download the main configuration file
    echo "Downloading init.vim..."
    if ! curl -fsSL https://raw.githubusercontent.com/norandom/nvim-simple/main/nvim/init.vim > ~/.config/nvim/init.vim; then
        echo "Failed to download configuration file"
        echo "   Make sure you have internet connection and the repository is accessible"
        exit 1
    fi

    # Download Berg colorscheme
    echo "Downloading Berg colorscheme..."
    if ! curl -fsSL https://raw.githubusercontent.com/norandom/nvim-simple/main/nvim/colors/berg.vim > ~/.config/nvim/colors/berg.vim; then
        echo "Failed to download berg.vim"
        exit 1
    fi
    if ! curl -fsSL https://raw.githubusercontent.com/norandom/nvim-simple/main/nvim/colors/berg-light.vim > ~/.config/nvim/colors/berg-light.vim; then
        echo "Failed to download berg-light.vim"
        exit 1
    fi
    if ! curl -fsSL https://raw.githubusercontent.com/norandom/nvim-simple/main/nvim/lua/berg.lua > ~/.config/nvim/lua/berg.lua; then
        echo "Failed to download berg.lua"
        exit 1
    fi
    if ! curl -fsSL https://raw.githubusercontent.com/norandom/nvim-simple/main/nvim/lua/berg-light.lua > ~/.config/nvim/lua/berg-light.lua; then
        echo "Failed to download berg-light.lua"
        exit 1
    fi
fi

# Create autoload directory and download vim-plug
echo "Installing vim-plug package manager..."
mkdir -p ~/.config/nvim/autoload
if ! curl -fsSL https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim > ~/.config/nvim/autoload/plug.vim; then
    echo "Failed to download vim-plug"
    exit 1
fi

# Install plugins
echo "Installing Neovim plugins (this may take a few minutes)..."
nvim --headless +PlugInstall +qall

# Wait a moment for plugin installation to complete
sleep 2

# Verify plugin installation
echo "Verifying plugin installation..."
if [ ! -d ~/.config/nvim/plugged/vim-quickui ]; then
    echo "Some plugins may not have installed correctly. Running second pass..."
    nvim --headless +PlugInstall +qall
    sleep 1
fi

echo ""
echo "Installation complete!"
echo ""
echo "Start Neovim with: nvim"
echo "  - Starts in insert mode"
echo "  - F10 for menu bar"
echo "  - F2 for file explorer"
echo ""
echo "Key shortcuts:"
echo "  Ctrl+C/V/X - Copy/Paste/Cut"
echo "  Ctrl+S - Save"
echo "  Ctrl+Z/Y - Undo/Redo"
echo "  Ctrl+T - New tab"
echo "  Ctrl+N - New file"
echo "  Ctrl+O - Open file"
echo ""
echo "Theme: Berg (Bloomberg terminal inspired dark theme)"
echo "Docs: https://github.com/norandom/nvim-simple"