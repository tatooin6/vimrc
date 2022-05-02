
" ██╗███╗░░██╗██╗████████╗░░░██╗░░░██╗██╗███╗░░░███╗
" ██║████╗░██║██║╚══██╔══╝░░░██║░░░██║██║████╗░████║
" ██║██╔██╗██║██║░░░██║░░░░░░╚██╗░██╔╝██║██╔████╔██║
" ██║██║╚████║██║░░░██║░░░░░░░╚████╔╝░██║██║╚██╔╝██║
" ██║██║░╚███║██║░░░██║░░░██╗░░╚██╔╝░░██║██║░╚═╝░██║
" ╚═╝╚═╝░░╚══╝╚═╝░░░╚═╝░░░╚═╝░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝

"---- vim-plug setup  ----
" let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
" if has('win32')&&!has('win64')
"   let curl_exists=expand('C:\Windows\Sysnative\curl.exe')
" else
"   let curl_exists=expand('curl')
" endif
" 
" if !filereadable(vimplug_exists)
"   if !executable(curl_exists)
"     echoerr 'You have to install curl or first install vim-plug yourself!'
"     execute 'q!'
"   endif
"   echo 'Installing Vim-Plug...'
"   echo ''
"   silent exec '!'curl_exists" -fLo ' . shellescape(vimplug_exists) . ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"   let g:not_finish_vimplug = 'yes'
" 
"   autocmd VimEnter * PlugInstall
" endif
"-------- end vim-plug setup ----

set nocompatible

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
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'quangnguyen30192/cmp-nvim-ultisnips' " For CMP autocompletion
 
" Telescope
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()

" Automatically install missing plugins on startup
" autocmd VimEnter *
"   \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
"   \|   PlugInstall --sync | q
"   \| endif

let mapleader=" "

if has('termguicolors')
  set termguicolors
endif

" ColorSchema
let g:tokyonight_style = 'storm'
let g:tokyonight_italic_functions = 1
let g:tokyonight_italic_comments = 1
let g:tokyonight_sidebars = [ 'qf', 'vista_kind', 'terminal', 'packer' ]
colorscheme tokyonight

" air-line
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
  
" airline symbols
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


" Editor Settings
syntax enable
filetype plugin indent on

set nu rnu
set completeopt=menuone,noinsert,noselect
set shortmess+=c
set expandtab
set smartindent
set tabstop=2 softtabstop=2
set cmdheight=2
set updatetime=1000 "50
set signcolumn=yes

" Custom Settings
set mouse=a
set numberwidth=1
set clipboard=unnamed
set showcmd
set ruler
set cursorline
set encoding=utf-8
set showmatch
set sw=2
set laststatus=2
set showmode
" set t_Co=256
set smartcase
set incsearch
set shiftwidth=2
set hidden
set scrolloff=8
set colorcolumn=80
set showtabline=2 " Always show tabs
set title

set completeopt=menu,menuone,noselect " CPM autocompletion
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

" UltiSnips CONFIGURATION
let g:UltiSnipsEditSplit="verttical"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsBackwardTrigger="<c-z>"
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" fzf config
nmap <Leader>b :Buffers<CR>

augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

" -------------------- LSP ---------------------------------

lua require('tatooin6') 

" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()

" Completion
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
 
" Avoid showing message extra message when using completion
set shortmess+=c
" -------------------- LSP ---------------------------------
