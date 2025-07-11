#!/bin/bash

# Neovim Easy Configuration Remote Installer
# Usage: curl -fsSL https://raw.githubusercontent.com/norandom/nvim-simple/main/install.sh | bash

set -e

echo "🚀 Installing Neovim Easy Configuration..."

# Check if nvim is installed
if ! command -v nvim &> /dev/null; then
    echo "❌ Neovim is not installed. Please install Neovim first."
    echo "   Ubuntu/Debian: sudo apt install neovim"
    echo "   macOS: brew install neovim"
    echo "   Other: https://github.com/neovim/neovim/wiki/Installing-Neovim"
    exit 1
fi

# Backup existing config if it exists
if [ -d ~/.config/nvim ]; then
    echo "📁 Backing up existing Neovim configuration..."
    mv ~/.config/nvim ~/.config/nvim.backup.$(date +%Y%m%d_%H%M%S)
    echo "   Backup saved to ~/.config/nvim.backup.$(date +%Y%m%d_%H%M%S)"
fi

# Create nvim config directory
echo "📂 Creating Neovim configuration directory..."
mkdir -p ~/.config/nvim

# Download the main configuration file
echo "📥 Downloading init.vim..."
if ! curl -fsSL https://raw.githubusercontent.com/norandom/nvim-simple/main/nvim/init.vim > ~/.config/nvim/init.vim; then
    echo "❌ Failed to download configuration file"
    echo "   Make sure you have internet connection and the repository is accessible"
    exit 1
fi

# Create autoload directory and download vim-plug
echo "📦 Installing vim-plug package manager..."
mkdir -p ~/.config/nvim/autoload
if ! curl -fsSL https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim > ~/.config/nvim/autoload/plug.vim; then
    echo "❌ Failed to download vim-plug"
    exit 1
fi

# Install plugins
echo "🔌 Installing Neovim plugins (this may take a few minutes)..."
nvim --headless +PlugInstall +qa

echo ""
echo "✨ Installation complete!"
echo ""
echo "🎯 Usage:"
echo "  • Start Neovim: nvim"
echo "  • Automatically starts in insert mode"
echo "  • Press F10 for menu bar"
echo "  • Press F2 for file explorer"
echo ""
echo "⌨️  Key shortcuts:"
echo "  • Ctrl+C/V/X - Copy/Paste/Cut"
echo "  • Ctrl+S - Save"
echo "  • Ctrl+Z/Y - Undo/Redo"
echo "  • Ctrl+T - New tab"
echo "  • Ctrl+N - New file"
echo "  • Ctrl+O - Open file"
echo ""
echo "🎨 Theme: Gruvbox Light (optimized for readability)"
echo "📖 Full documentation: https://github.com/norandom/nvim-simple"
echo ""
echo "Happy editing! 🎉"