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
set background=dark

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
let g:airline_theme = 'dark'

" Menu bar setup
let g:quickui_show_tip = 1
let g:quickui_color_scheme = 'system'

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

" Apply Berg colorscheme after plugins load
autocmd VimEnter * ++nested colorscheme berg

" Show menu bar hint
echo "Press F10 for menu bar, F2 for file explorer"