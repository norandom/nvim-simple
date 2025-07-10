" Neovim Configuration - Simple Editor Mode with CUA
" Auto-install vim-plug if not found
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim-plug plugins
call plug#begin('~/.config/nvim/plugged')

" Tab bar
Plug 'ap/vim-buftabline'

" Menu bar
Plug 'skywind3000/vim-quickui'

" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" File explorer
Plug 'preservim/nerdtree'

" Icons
Plug 'ryanoasis/vim-devicons'

" Gruvbox colorscheme
Plug 'morhetz/gruvbox'

call plug#end()

" Basic settings
set number
set relativenumber
set mouse=a
set clipboard=unnamedplus
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set wrap
set linebreak
set scrolloff=5
set sidescrolloff=5
set hidden
set updatetime=300
set signcolumn=yes
set termguicolors
set background=light

" Start in insert mode
autocmd VimEnter * startinsert

" CUA mode mappings (Ctrl+C/V/X/A/S/Z/Y)
" Copy
vnoremap <C-c> "+y
" Cut
vnoremap <C-x> "+x
" Paste
inoremap <C-v> <C-r>+
vnoremap <C-v> "+p
nnoremap <C-v> "+p
" Select all
nnoremap <C-a> ggVG
inoremap <C-a> <Esc>ggVG
" Save
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a
" Undo
nnoremap <C-z> u
inoremap <C-z> <Esc>ua
" Redo
nnoremap <C-y> <C-r>
inoremap <C-y> <Esc><C-r>a

" Tab navigation
nnoremap <C-t> :tabnew<CR>
inoremap <C-t> <Esc>:tabnew<CR>
nnoremap <C-w> :tabclose<CR>
inoremap <C-w> <Esc>:tabclose<CR>
nnoremap <C-Tab> :tabnext<CR>
inoremap <C-Tab> <Esc>:tabnext<CR>
nnoremap <C-S-Tab> :tabprevious<CR>
inoremap <C-S-Tab> <Esc>:tabprevious<CR>

" Buffer navigation with tab bar
let g:buftabline_show = 2
let g:buftabline_numbers = 1
let g:buftabline_indicators = 1

" Airline configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme = 'gruvbox'

" Menu bar setup
let g:quickui_show_tip = 1
let g:quickui_color_scheme = 'gruvbox'

" Menu content
let g:quickui_menubar = [
    \ ['&File', [
        \ ['&New\tCtrl+N', 'enew'],
        \ ['&Open\tCtrl+O', 'browse edit'],
        \ ['--', ''],
        \ ['&Save\tCtrl+S', 'write'],
        \ ['Save &As', 'browse saveas'],
        \ ['--', ''],
        \ ['&Close\tCtrl+W', 'close'],
        \ ['E&xit', 'qa'],
        \ ]],
    \ ['&Edit', [
        \ ['&Undo\tCtrl+Z', 'undo'],
        \ ['&Redo\tCtrl+Y', 'redo'],
        \ ['--', ''],
        \ ['&Cut\tCtrl+X', 'normal! "+x'],
        \ ['&Copy\tCtrl+C', 'normal! "+y'],
        \ ['&Paste\tCtrl+V', 'normal! "+p'],
        \ ['--', ''],
        \ ['Select &All\tCtrl+A', 'normal! ggVG'],
        \ ]],
    \ ['&View', [
        \ ['&File Explorer\tF2', 'NERDTreeToggle'],
        \ ['&Toggle Line Numbers', 'set number!'],
        \ ]],
    \ ['&Help', [
        \ ['&About', 'version'],
        \ ]],
    \ ]

" Enable menu bar
noremap <F10> :call quickui#menu#open()<CR>
inoremap <F10> <Esc>:call quickui#menu#open()<CR>

" File operations
nnoremap <C-n> :enew<CR>
inoremap <C-n> <Esc>:enew<CR>
nnoremap <C-o> :browse edit<CR>
inoremap <C-o> <Esc>:browse edit<CR>

" NERDTree
nnoremap <F2> :NERDTreeToggle<CR>
inoremap <F2> <Esc>:NERDTreeToggle<CR>

" Exit insert mode with Escape but return to insert mode on movement
nnoremap <Left> i<Left>
nnoremap <Right> i<Right>
nnoremap <Up> i<Up>
nnoremap <Down> i<Down>
nnoremap <Home> i<Home>
nnoremap <End> i<End>
nnoremap <PageUp> i<PageUp>
nnoremap <PageDown> i<PageDown>

" Keep in insert mode when opening files
autocmd BufReadPost * startinsert

" Mouse support enhancements
set mouse=a
if has('mouse_sgr')
    set ttymouse=sgr
endif

" Better search
set ignorecase
set smartcase
set hlsearch
set incsearch

" Auto-complete
set completeopt=menuone,noinsert,noselect

" Gruvbox theme configuration
let g:gruvbox_contrast_light = 'medium'
let g:gruvbox_improved_strings = 1
let g:gruvbox_improved_warnings = 1
let g:gruvbox_transparent_bg = 0
let g:gruvbox_sign_column = 'bg0'
let g:gruvbox_number_column = 'bg1'
let g:gruvbox_color_column = 'bg1'
let g:gruvbox_vert_split = 'bg2'
let g:gruvbox_italicize_comments = 1
let g:gruvbox_italicize_strings = 0

" Apply colorscheme after plugins load
autocmd VimEnter * ++nested colorscheme gruvbox

" Custom highlights for better readability in light mode
autocmd ColorScheme gruvbox highlight Normal guibg=#fbf1c7 guifg=#3c3836
autocmd ColorScheme gruvbox highlight LineNr guibg=#f2e5bc guifg=#7c6f64
autocmd ColorScheme gruvbox highlight CursorLineNr guibg=#ebdbb2 guifg=#af3a03 gui=bold
autocmd ColorScheme gruvbox highlight Visual guibg=#d5c4a1 guifg=#3c3836
autocmd ColorScheme gruvbox highlight Search guibg=#fabd2f guifg=#1d2021
autocmd ColorScheme gruvbox highlight IncSearch guibg=#fe8019 guifg=#1d2021
autocmd ColorScheme gruvbox highlight StatusLine guibg=#d5c4a1 guifg=#3c3836
autocmd ColorScheme gruvbox highlight StatusLineNC guibg=#ebdbb2 guifg=#665c54
autocmd ColorScheme gruvbox highlight TabLine guibg=#ebdbb2 guifg=#665c54
autocmd ColorScheme gruvbox highlight TabLineSel guibg=#d5c4a1 guifg=#3c3836 gui=bold
autocmd ColorScheme gruvbox highlight TabLineFill guibg=#f2e5bc
autocmd ColorScheme gruvbox highlight Comment guifg=#928374 gui=italic
autocmd ColorScheme gruvbox highlight String guifg=#79740e
autocmd ColorScheme gruvbox highlight Keyword guifg=#9d0006 gui=bold
autocmd ColorScheme gruvbox highlight Function guifg=#b57614 gui=bold
autocmd ColorScheme gruvbox highlight Type guifg=#af3a03 gui=bold
autocmd ColorScheme gruvbox highlight Constant guifg=#8f3f71
autocmd ColorScheme gruvbox highlight PreProc guifg=#427b58
autocmd ColorScheme gruvbox highlight Special guifg=#d79921
autocmd ColorScheme gruvbox highlight Error guibg=#cc241d guifg=#fbf1c7
autocmd ColorScheme gruvbox highlight Warning guibg=#d79921 guifg=#3c3836
autocmd ColorScheme gruvbox highlight Directory guifg=#427b58 gui=bold
autocmd ColorScheme gruvbox highlight Title guifg=#af3a03 gui=bold
autocmd ColorScheme gruvbox highlight MatchParen guibg=#fe8019 guifg=#1d2021 gui=bold
autocmd ColorScheme gruvbox highlight Pmenu guibg=#ebdbb2 guifg=#3c3836
autocmd ColorScheme gruvbox highlight PmenuSel guibg=#d5c4a1 guifg=#3c3836 gui=bold
autocmd ColorScheme gruvbox highlight PmenuSbar guibg=#d5c4a1
autocmd ColorScheme gruvbox highlight PmenuThumb guibg=#665c54

" NERDTree colors
autocmd ColorScheme gruvbox highlight NERDTreeDir guifg=#427b58 gui=bold
autocmd ColorScheme gruvbox highlight NERDTreeFile guifg=#3c3836
autocmd ColorScheme gruvbox highlight NERDTreeExecFile guifg=#b57614 gui=bold
autocmd ColorScheme gruvbox highlight NERDTreeOpenable guifg=#d79921
autocmd ColorScheme gruvbox highlight NERDTreeClosable guifg=#d79921

" Buftabline colors for better contrast
autocmd ColorScheme gruvbox highlight BufTabLineCurrent guibg=#d5c4a1 guifg=#3c3836 gui=bold
autocmd ColorScheme gruvbox highlight BufTabLineActive guibg=#ebdbb2 guifg=#3c3836
autocmd ColorScheme gruvbox highlight BufTabLineHidden guibg=#f2e5bc guifg=#665c54
autocmd ColorScheme gruvbox highlight BufTabLineFill guibg=#f2e5bc

" Show menu bar hint
echo "Press F10 for menu bar, F2 for file explorer"