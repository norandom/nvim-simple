# Neovim Easy Configuration

A simple editor configuration for Neovim with CUA (Common User Access) shortcuts, tab bar, mouse support, and menu bar. Optimized for the Gruvbox light theme.

## Features

- **Starts in Insert Mode** - Behaves like a conventional text editor
- **CUA Mode** - Standard keyboard shortcuts (Ctrl+C, Ctrl+V, etc.)
- **Tab Bar** - Visual tabs for open buffers
- **Mouse Support** - Full mouse support from terminal
- **Menu Bar** - Traditional File/Edit/View/Help menus
- **Gruvbox Light Theme** - Optimized for readability

## Installation

### Quick Install (Recommended)

**One-line remote installation:**
```bash
curl -fsSL https://raw.githubusercontent.com/norandom/nvim-simple/main/install.sh | bash
```

This will:
- Backup any existing Neovim configuration
- Download and install the configuration
- Install vim-plug and all plugins automatically
- Set up the complete environment

### Manual Installation

1. Ensure you have Neovim installed
2. Clone this repository: `git clone https://github.com/norandom/nvim-simple.git`
3. Copy the `nvim` directory to `~/.config/nvim` or create a symlink
4. Open Neovim - plugins will auto-install on first run

### Temporary Trial (No Installation)

Try the configuration without installing:
```bash
curl -s https://raw.githubusercontent.com/norandom/nvim-simple/main/nvim/init.vim > /tmp/nvim-config.vim && nvim -u /tmp/nvim-config.vim +PlugInstall +qall && nvim -u /tmp/nvim-config.vim
```

## Keyboard Shortcuts

### CUA Mode (Standard Editor Shortcuts)
- **Ctrl+C** - Copy selected text
- **Ctrl+X** - Cut selected text
- **Ctrl+V** - Paste text
- **Ctrl+A** - Select all text
- **Ctrl+S** - Save file
- **Ctrl+Z** - Undo
- **Ctrl+Y** - Redo

### File Operations
- **Ctrl+N** - New file
- **Ctrl+O** - Open file
- **Ctrl+W** - Close current tab/buffer

### Tab Navigation
- **Ctrl+T** - Open new tab
- **Ctrl+Tab** - Next tab
- **Ctrl+Shift+Tab** - Previous tab

### Interface
- **F10** - Open menu bar
- **F2** - Toggle file explorer (NERDTree)
- **Esc** - Exit insert mode (but arrow keys return to insert mode)

### Movement in Insert Mode
- **Arrow Keys** - Move cursor while staying in insert mode
- **Home/End** - Move to beginning/end of line
- **Page Up/Down** - Page navigation

## Menu Bar

Press **F10** to access the menu bar with the following options:

### File Menu
- New (Ctrl+N)
- Open (Ctrl+O)
- Save (Ctrl+S)
- Save As
- Close (Ctrl+W)
- Exit

### Edit Menu
- Undo (Ctrl+Z)
- Redo (Ctrl+Y)
- Cut (Ctrl+X)
- Copy (Ctrl+C)
- Paste (Ctrl+V)
- Select All (Ctrl+A)

### View Menu
- File Explorer (F2)
- Toggle Line Numbers

### Help Menu
- About

## Plugins Used

- **vim-plug** - Plugin manager
- **gruvbox** - Color scheme
- **vim-airline** - Status line and tab line
- **vim-buftabline** - Buffer tabs
- **vim-quickui** - Menu bar interface
- **nerdtree** - File explorer
- **vim-devicons** - File icons

## Theme Configuration

The configuration uses **Gruvbox Light** theme with:
- Medium contrast for better readability
- Optimized syntax highlighting
- Enhanced tab and status line visibility
- Improved search highlighting
- Better line number contrast

## Customization

The main configuration file is `nvim/init.vim`. You can modify:
- Color scheme settings
- Keyboard shortcuts
- Plugin configurations
- Menu bar contents

## Troubleshooting

If plugins don't load:
1. Open Neovim
2. Run `:PlugInstall` to install plugins
3. Restart Neovim

If colors look wrong:
1. Ensure your terminal supports 256 colors or true color
2. Check that `termguicolors` is enabled in your terminal

## Philosophy

This configuration transforms Neovim into a simple, accessible text editor while retaining its powerful features. Perfect for users who want:
- Familiar keyboard shortcuts
- Mouse support
- Visual interface elements
- Easy file management
- Readable color scheme

The goal is to provide a bridge between traditional text editors and Vim/Neovim for users who prefer conventional editing patterns.