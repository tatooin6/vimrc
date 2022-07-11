
" ██╗███╗░░██╗██╗████████╗░░░██╗░░░██╗██╗███╗░░░███╗
" ██║████╗░██║██║╚══██╔══╝░░░██║░░░██║██║████╗░████║
" ██║██╔██╗██║██║░░░██║░░░░░░╚██╗░██╔╝██║██╔████╔██║
" ██║██║╚████║██║░░░██║░░░░░░░╚████╔╝░██║██║╚██╔╝██║
" ██║██║░╚███║██║░░░██║░░░██╗░░╚██╔╝░░██║██║░╚═╝░██║
" ╚═╝╚═╝░░╚══╝╚═╝░░░╚═╝░░░╚═╝░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝


" ==================================================================
" ============================= Pluggins ===========================
" ==================================================================

call plug#begin('~/.config/nvim/plugged')

" Sensible default 
Plug 'tpope/vim-sensible'

" Color schemes
" Plug 'sainnhe/edge'
" Plug 'morhetz/gruvbox'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" LSP and Auto-Completion
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'neoclide/npm.nvim', {'do' : 'npm install'}
Plug 'jose-elias-alvarez/null-ls.nvim' " LSP_TS
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils' " LSP_TS

" CMP Autocompletion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" Lua Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Clock
Plug 'enricobacis/vim-airline-clock'

" IDE
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jiangmiao/auto-pairs' " Auto close ( [ {
 
" Highlighting and Indenting JSX and TSX files.
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
 
" Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Lints
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'

" EMMET for vim
Plug 'mattn/emmet-vim'

" Help searching and completition
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Seing color on editor
Plug 'ap/vim-css-color'
 
" Snippets
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
" Plug 'quangnguyen30192/cmp-nvim-ultisnips' " For CMP autocompletion
 
" Telescope
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()

" ==================================================================
" ========================= Editor Settings ========================
" ==================================================================

let mapleader=" "

if has('termguicolors')
  set termguicolors
endif

syntax enable
filetype plugin indent on

set nocompatible

augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

" LUA settings
" set completeopt=menuone,noinsert,noselect
lua << EOF
vim.opt.completeopt={"menu", "menuone", "noselect"} 
vim.opt.number=true
vim.opt.relativenumber=true
vim.opt.showmode=true
vim.opt.expandtab=true
vim.opt.shortmess:append "c"
vim.opt.expandtab=true
vim.opt.smartindent=true
vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.cmdheight=2
vim.opt.updatetime=1000
vim.opt.signcolumn="yes"
vim.opt.mouse="a"
vim.opt.numberwidth=1
vim.opt.clipboard="unnamedplus"
vim.opt.showcmd=true
vim.opt.ruler=true
vim.opt.cursorline=true
vim.opt.encoding="utf-8"
vim.opt.showmatch=true
vim.opt.sw=2
vim.opt.laststatus=2
vim.opt.smartcase=true
vim.opt.incsearch=true
vim.opt.shiftwidth=2
vim.opt.hidden=true
vim.opt.scrolloff=8
vim.opt.colorcolumn="80"
vim.opt.showtabline=2 -- Always show tabs
vim.opt.title=true
EOF
" `vim.opt.relativenumber=true

" ==================================================================
" ====================== Plugins Configuration =====================
" ==================================================================

" ColorSchema
let g:tokyonight_style = 'storm'
let g:tokyonight_italic_functions = 1
let g:tokyonight_italic_comments = 1
let g:tokyonight_sidebars = [ 'qf', 'vista_kind', 'terminal', 'packer' ]
colorscheme tokyonight

" Air-line
let g:airline_theme = 'base16'
let g:airline_powerline_fonts = 1
let g:airline#extensions#clock#auto = 1
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
" let g:airline_section_x = '' " Filetype
let g:airline_section_y = ''
" 
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
  
" Airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = 'ß'
let g:airline_symbols.readonly = ''
let g:airline_symbols.paste = ' '
let g:airline_symbols.colnr = ' C'
let g:airline_symbols.maxlinenr = ' '
let g:airline_symbols.crypt = ' '
let g:airline_symbols.linenr = ' '
let g:airline_symbols.spell = 'B'
let g:airline_symbols.notexists = 'A'
let g:airline_symbols.dirty=''
let g:airline_symbols.whitespace = 'Ξ'

" NERDTree
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1

" GitGutter for git - Use fontawesome icons as signs
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0
let g:gitgutter_git_executable = "C:\\PROGRA~1\\Git\\bin\\git.exe"
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
" let g:gitgutter_override_sign_column_highlight = 1
" let g:gitgutter_log = 1
let g:gitgutter_async=0
highlight GitGutterAdd guifg=#009900 ctermfg=Green
highlight GitGutterChange guifg=#bbbb00 ctermfg=Yellow
highlight GitGutterDelete guifg=#ff2222 ctermfg=Red
" highlight SignColumn guibg=bg
" highlight SignColumn ctermbg=bg
nmap ) <Plug>(GitGutterNextHunk)
nmap ( <Plug>(GitGutterPrevHunk)

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
" Right
nmap <Leader>gj :diffget //3<CR>
" Left
nmap <Leader>gf :diffget //2<CR>
nmap <Leader>gs :G<CR>

" Telescope configurations
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep prompt_prefix<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fs <cmd>Telescope git_status<cr>
nnoremap <leader>fc <cmd>Telescope command_history<cr>

" Fzf config
nmap <Leader>b :Buffers<CR>

" -------------------- LSP ---------------------------------
lua require('tatooin6') 
" -------------------- LSP ---------------------------------
