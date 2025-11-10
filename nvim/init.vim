" Neovim Configuration - Simple Editor Mode with CUA
" Auto-install vim-plug if not found
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Configure plugins BEFORE loading them
" Disable powerline fonts - use ASCII only
let g:airline_powerline_fonts = 0
let g:airline_symbols_ascii = 1
" Disable devicons to prevent Unicode issues
let g:webdevicons_enable = 0
let g:webdevicons_enable_nerdtree = 0
let g:webdevicons_enable_airline_tabline = 0
let g:webdevicons_enable_airline_statusline = 0
" QuickUI ASCII mode
let g:quickui_border_style = 1

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
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline_theme = 'dark'

" Custom tab title function
function! AirlineTabTitle(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    let bufnr = buflist[winnr - 1]
    " Check if custom title exists
    let title = gettabvar(a:n, 'tab_title')
    if !empty(title)
        return title
    endif
    " Default to buffer name
    let name = bufname(bufnr)
    if empty(name)
        return '[No Name]'
    elseif name =~ 'term://'
        return 'Terminal'
    else
        return fnamemodify(name, ':t')
    endif
endfunction
let g:airline#extensions#tabline#tabnr_formatter = 'AirlineTabTitle'

" Override airline symbols for ASCII mode (duplicates removed - set at top)
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = 'RO'
let g:airline_symbols.linenr = 'LN'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty = '*'

" Menu bar setup
let g:quickui_show_tip = 1
let g:quickui_color_scheme = 'system'

" Setup menu directly - clear all the menus
call quickui#menu#reset()

" install a 'File' menu
call quickui#menu#install('&File', [
            \ [ "&New File\tCtrl+n", 'enew' ],
            \ [ "&Open File\tCtrl+o", 'browse edit' ],
            \ [ "&Close", 'close' ],
            \ [ "--", '' ],
            \ [ "&Save\tCtrl+s", 'write'],
            \ [ "Save &As", 'browse saveas' ],
            \ [ "--", '' ],
            \ [ "E&xit", 'qa' ],
            \ ])

" Edit menu with tips
call quickui#menu#install('&Edit', [
            \ [ '&Copy\tCtrl+c', 'normal! "+y', 'Copy to clipboard' ],
            \ [ '&Paste\tCtrl+v', 'normal! "+p', 'Paste from clipboard' ],
            \ [ '&Undo\tCtrl+z', 'undo', 'Undo last change' ],
            \ [ '&Redo\tCtrl+y', 'redo', 'Redo last undo' ],
            \ ])

" Option menu with dynamic status
call quickui#menu#install("&Option", [
            \ ['Set &Spell %{&spell? "Off":"On"}', 'set spell!'],
            \ ['Set &Cursor Line %{&cursorline? "Off":"On"}', 'set cursorline!'],
            \ ['Set &Paste %{&paste? "Off":"On"}', 'set paste!'],
            \ ])

" Terminal menu
call quickui#menu#install('&Terminal', [
            \ ['&New Terminal Tab', 'tabnew | terminal'],
            \ ['&Split Terminal', 'split | terminal'],
            \ ['&Vertical Split Terminal', 'vsplit | terminal'],
            \ ['--', ''],
            \ ['&Close Terminal', 'if &buftype=="terminal" | bd! | endif'],
            \ ['&Kill Terminal Process', 'if &buftype=="terminal" | bd! | endif'],
            \ ['--', ''],
            \ ['&Next Tab\tCtrl+Tab', 'tabnext'],
            \ ['&Previous Tab\tCtrl+Shift+Tab', 'tabprevious'],
            \ ['--', ''],
            \ ['Rename &Tab Title', 'call inputsave() | let t:tab_title=input("Tab title: ") | call inputrestore()'],
            \ ['--', ''],
            \ ['&File Explorer\tF2', 'NERDTreeToggle'],
            \ ])

" Help menu
call quickui#menu#install('H&elp', [
            \ ["&Cheatsheet", 'help index', ''],
            \ ['T&ips', 'help tips', ''],
            \ ['--',''],
            \ ["&Tutorial", 'help tutor', ''],
            \ ['&Quick Reference', 'help quickref', ''],
            \ ], 10000)

" Enable menu keybindings (including from terminal mode)
noremap <silent><F10> :call quickui#menu#open()<CR>
inoremap <silent><F10> <Esc>:call quickui#menu#open()<CR>
tnoremap <silent><F10> <C-\><C-n>:call quickui#menu#open()<CR>
noremap <space><space> :call quickui#menu#open()<CR>
tnoremap <space><space> <C-\><C-n>:call quickui#menu#open()<CR>

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

" Terminal settings - clean UI and better usability
autocmd TermOpen * setlocal nonumber norelativenumber signcolumn=no
" Auto-enter insert mode when opening terminal
autocmd TermOpen * startinsert
" Auto-enter insert mode when entering terminal buffer
autocmd BufEnter term://* startinsert
" Hide status line in terminal for cleaner look
autocmd TermOpen * setlocal laststatus=0

" Terminal keybindings (SSH/Mac friendly)
" F3 opens terminal in new tab (works over SSH)
nnoremap <F3> :tabnew \| terminal<CR>
inoremap <F3> <Esc>:tabnew \| terminal<CR>
" Leader+t as alternative (default leader is backslash)
nnoremap <Leader>t :tabnew \| terminal<CR>
inoremap <Leader>t <Esc>:tabnew \| terminal<CR>
" ESC in terminal mode enters normal mode (for scrolling/copying)
tnoremap <Esc> <C-\><C-n>
" Ctrl+W closes terminal tab from terminal mode
tnoremap <C-w> <C-\><C-n>:q<CR>
" Tab navigation from terminal mode (works over SSH)
tnoremap <C-PageUp> <C-\><C-n>:tabprevious<CR>
tnoremap <C-PageDown> <C-\><C-n>:tabnext<CR>

" Apply Berg colorscheme after plugins load
autocmd VimEnter * ++nested colorscheme berg

" Show menu bar hint after everything loads
autocmd VimEnter * echo "Press F10 for menu bar, F2 for file explorer"