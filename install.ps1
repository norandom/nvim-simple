# Neovim Easy Configuration Installer for Windows
# Usage:
#   Local: .\install.ps1
#   Remote: iwr -useb https://raw.githubusercontent.com/norandom/nvim-simple/main/install.ps1 | iex

Write-Host "Installing Neovim Easy Configuration..." -ForegroundColor Cyan

# Check if nvim is installed
if (-not (Get-Command nvim -ErrorAction SilentlyContinue)) {
    Write-Host "Neovim is not installed. Please install Neovim first." -ForegroundColor Red
    Write-Host "  Download from: https://github.com/neovim/neovim/releases" -ForegroundColor Yellow
    Write-Host "  Or install via: winget install Neovim.Neovim" -ForegroundColor Yellow
    Write-Host "  Or install via: scoop install neovim" -ForegroundColor Yellow
    exit 1
}

# Detect Neovim config path using nvim itself
Write-Host "Detecting Neovim configuration path..." -ForegroundColor Cyan
$nvimPathOutput = nvim --headless --noplugin +'echo stdpath("config")' +q 2>&1
if ($nvimPathOutput) {
    # Filter out error messages and get the actual path
    $nvimPath = ($nvimPathOutput | Where-Object { $_ -is [string] -and $_ -match '^[A-Za-z]:\\' } | Select-Object -Last 1)
    if ($nvimPath) {
        $nvimPath = $nvimPath.Trim()
    }
}
if (-not $nvimPath -or $nvimPath -eq "") {
    # Fallback to default Windows path
    $nvimPath = "$env:LOCALAPPDATA\nvim"
}
Write-Host "  Using config path: $nvimPath" -ForegroundColor Green

# Backup existing config if it exists
if (Test-Path $nvimPath) {
    $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
    $backupPath = "$env:LOCALAPPDATA\nvim.backup.$timestamp"
    Write-Host "Backing up existing Neovim configuration..." -ForegroundColor Yellow
    Move-Item -Path $nvimPath -Destination $backupPath
    Write-Host "  Backup saved to $backupPath" -ForegroundColor Green
}

# Create nvim config directory
Write-Host "Creating Neovim configuration directory..." -ForegroundColor Cyan
New-Item -ItemType Directory -Path $nvimPath -Force | Out-Null
New-Item -ItemType Directory -Path "$nvimPath\colors" -Force | Out-Null
New-Item -ItemType Directory -Path "$nvimPath\lua" -Force | Out-Null
New-Item -ItemType Directory -Path "$nvimPath\autoload" -Force | Out-Null

# Check if running from local repo or remote
$scriptPath = $PSScriptRoot
if ($scriptPath -and (Test-Path "$scriptPath\nvim\init.vim")) {
    # Local installation
    Write-Host "Installing from local repository..." -ForegroundColor Cyan
    Copy-Item -Path "$scriptPath\nvim\init.vim" -Destination "$nvimPath\init.vim" -Force
    Copy-Item -Path "$scriptPath\nvim\colors\berg.vim" -Destination "$nvimPath\colors\berg.vim" -Force
    Copy-Item -Path "$scriptPath\nvim\lua\berg.lua" -Destination "$nvimPath\lua\berg.lua" -Force
} else {
    # Remote installation
    Write-Host "Downloading configuration files..." -ForegroundColor Cyan

    $baseUrl = "https://raw.githubusercontent.com/norandom/nvim-simple/main"

    try {
        Invoke-WebRequest -Uri "$baseUrl/nvim/init.vim" -OutFile "$nvimPath\init.vim"
        Invoke-WebRequest -Uri "$baseUrl/nvim/colors/berg.vim" -OutFile "$nvimPath\colors\berg.vim"
        Invoke-WebRequest -Uri "$baseUrl/nvim/lua/berg.lua" -OutFile "$nvimPath\lua\berg.lua"
    } catch {
        Write-Host "Failed to download configuration files" -ForegroundColor Red
        Write-Host "  Make sure you have internet connection and the repository is accessible" -ForegroundColor Yellow
        exit 1
    }
}

# Download vim-plug
Write-Host "Installing vim-plug package manager..." -ForegroundColor Cyan
try {
    $plugPath = "$nvimPath\autoload\plug.vim"
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" -OutFile $plugPath
} catch {
    Write-Host "Failed to download vim-plug" -ForegroundColor Red
    exit 1
}

# Install plugins
Write-Host "Installing Neovim plugins (this may take a few minutes)..." -ForegroundColor Cyan
$plugOutput = & nvim --headless --noplugin +'set nomore' +PlugInstall +qall 2>&1
$plugOutput | ForEach-Object { Write-Host "  $_" }

# Wait for plugin installation to complete
Start-Sleep -Seconds 2

# Verify plugin installation
Write-Host "Verifying plugin installation..." -ForegroundColor Cyan
$pluginPath = "$nvimPath\plugged\vim-quickui"
if (-not (Test-Path $pluginPath)) {
    Write-Host "  Some plugins may not have installed correctly. Running second pass..." -ForegroundColor Yellow
    $plugOutput2 = & nvim --headless --noplugin +'set nomore' +PlugInstall +qall 2>&1
    $plugOutput2 | ForEach-Object { Write-Host "  $_" }
    Start-Sleep -Seconds 1
} else {
    Write-Host "  All plugins installed successfully!" -ForegroundColor Green
}

Write-Host ""
Write-Host "Installation complete!" -ForegroundColor Green
Write-Host ""
Write-Host "Usage:" -ForegroundColor Cyan
Write-Host "  - Start Neovim: nvim" -ForegroundColor White
Write-Host "  - Automatically starts in insert mode" -ForegroundColor White
Write-Host "  - Press F10 for menu bar" -ForegroundColor White
Write-Host "  - Press F2 for file explorer" -ForegroundColor White
Write-Host ""
Write-Host "Key shortcuts:" -ForegroundColor Cyan
Write-Host "  - Ctrl+C/V/X - Copy/Paste/Cut" -ForegroundColor White
Write-Host "  - Ctrl+S - Save" -ForegroundColor White
Write-Host "  - Ctrl+Z/Y - Undo/Redo" -ForegroundColor White
Write-Host "  - Ctrl+T - New tab" -ForegroundColor White
Write-Host "  - Ctrl+N - New file" -ForegroundColor White
Write-Host "  - Ctrl+O - Open file" -ForegroundColor White
Write-Host ""
Write-Host "Theme: Berg (Bloomberg terminal inspired dark theme)" -ForegroundColor Cyan
Write-Host "Documentation: https://github.com/norandom/nvim-simple" -ForegroundColor Cyan
Write-Host ""
Write-Host "Happy editing!" -ForegroundColor Green
