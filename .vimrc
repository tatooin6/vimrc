syntax on

set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax enable
set showcmd
set ruler
set cursorline
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
set laststatus=2
set showmode
set t_Co=256
set updatetime=100

" ThePrimeangen Config
set smartindent
" set nowrap " doesn't wrap the code
set smartcase
set incsearch

set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
" set nohlsearch " clear searched criteria after findind it
set hidden
set scrolloff=8
" set signcolumn=yes " setted up for typescript in the end of this file
set colorcolumn=80

call plug#begin('~/.vim/plugged')

" Themes
Plug 'morhetz/gruvbox'

" IDE
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'

" Clock
Plug 'enricobacis/vim-airline-clock'

" Lints
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'

" EMMET for vim
Plug 'mattn/emmet-vim'

" Help searching and completition
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" AutoClose ( [ {
Plug 'jiangmiao/auto-pairs' 

" these two plugins will add highlighting and indenting to JSX and TSX files.
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Seing color on editor
Plug 'ap/vim-css-color'

" Snippets
" Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Telescope
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'

call plug#end()

colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"

" NERDTree
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1

let mapleader=" "

" air-line
let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16'
let g:airline#extensions#clock#auto = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1
let g:airline_left_sep=''
let g:airline_right_sep=''

" enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

" enable powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" Switch to your current theme
" let g:airline_theme = 'onedark'

" Always show tabs
set showtabline=2

" We don't need to see things like -- INSERT -- anymore
" set noshowmode

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = ''
let g:airline_right_sep = '«'
let g:airline_right_sep = ''
let g:airline_symbols.linenr = '|'
let g:airline_symbols.linenr = '|'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = 'ß'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = 'p'
let g:airline_symbols.whitespace = 'Ξ'

" GitGutter for git - Use fontawesome icons as signs
let g:gitgutter_git_executable = 'C:\Program Files\Git\bin\git.exe'
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'

let g:gitgutter_override_sign_column_highlight = 1
highlight SignColumn guibg=bg
highlight SignColumn ctermbg=bg

" SEARCH
nmap <Leader>s <Plug>(easymotion-s2)

" MENU
nmap <Leader>nt :NERDTreeFind<CR>

" SAVE AND QUIT
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>

" CLEAN Searched
nmap <Leader>l :noh<CR>

" GIT
" nmap <Leader>g :Git
" Derecha
nmap <Leader>gj :diffget //3<CR>
" Izquierda
nmap <Leader>gf :diffget //2<CR>
nmap <Leader>gs :G<CR>

" UltiSnips CONFIGURATION
let g:UltiSnipsEditSplit="verttical"
let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsBackwardTrigger="<c-z>"

" fzf config
nmap <Leader>b :Buffers<CR>

" Telescope configurations
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep prompt_prefix<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <leader>fs <cmd>Telescope git_status<cr>
nnoremap <leader>fc <cmd>Telescope command_history<cr>

