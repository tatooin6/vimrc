

-- Pluggins

local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

-- Sensible default 
Plug 'tpope/vim-sensible'

-- Color schemes
-- Plug 'sainnhe/edge'
-- Plug 'morhetz/gruvbox'
Plug('folke/tokyonight.nvim', { branch = 'main' })

-- LSP and Auto-Completion
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug('neoclide/npm.nvim', { ['do'] = 'npm install' })
Plug 'jose-elias-alvarez/null-ls.nvim' -- LSP_TS
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils' -- LSP_TS

-- CMP Autocompletion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

-- Lua Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

-- Treesitter
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

-- Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

-- Clock
Plug 'enricobacis/vim-airline-clock'

-- IDE
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jiangmiao/auto-pairs' -- Auto close ( [ {
 
-- Highlighting and Indenting JSX and TSX files.
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
 
-- Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

-- Lints
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'

-- EMMET for vim
Plug 'mattn/emmet-vim'

-- Help searching and completition
Plug('junegunn/fzf', { 
	['do'] = function()
		vim.call('fzf#install') 
	end
})
Plug 'junegunn/fzf.vim'

-- Seing color on editor
Plug 'ap/vim-css-color'
 
-- Telescope
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

vim.call('plug#end')

-- Settings modified
vim.g.mapleader = " "

vim.g.tokyonight_style = 'storm'
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_italic_comments = true
vim.g.tokyonight_sidebars = { 'qf', 'vista_kind', 'terminal', 'packer' }
vim.cmd[[colorscheme tokyonight]]

if(vim.opt.termguicolors)
then
  vim.opt.termguicolors = true
end

-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd[[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
augroup END
]]

-- Configurations
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
