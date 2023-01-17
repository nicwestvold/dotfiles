local Plug = vim.fn['plug#']

-- vim.call('plug#begin', '~/.vim/plugged')
vim.call('plug#begin', '~/.config/nvim/plugged')

-- """ functionality
Plug 'nvim-tree/nvim-web-devicons' -- " optional, for file icons
Plug 'nvim-tree/nvim-tree.lua'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'sethlowie/vim-test'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'

-- " Git worktree
Plug 'ThePrimeagen/git-worktree.nvim'
-- " status bar
Plug 'hoob3rt/lualine.nvim'
Plug 'nvim-lua/popup.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
vim.cmd("Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }")

vim.cmd("Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}")

-- """ languages
-- "" Go
vim.cmd("Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }")
-- "" Rust
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
-- "" JS/TS
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'peitalin/vim-jsx-typescript'
Plug 'leafgarland/typescript-vim'
-- "" Elm
Plug 'ElmCast/elm-vim'
-- "" svelte
vim.cmd("Plug 'evanleck/vim-svelte', {'branch': 'main'}")

-- """ utility
-- vim.cmd("Plug 'neoclide/coc.nvim', {'branch': 'release'}")
Plug 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
vim.cmd("Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }")
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
vim.cmd("Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}")

Plug 'jremmen/vim-ripgrep'
Plug 'mattn/emmet-vim'
vim.cmd("Plug 'prettier/vim-prettier', { 'do': 'npm install', 'branch': 'release/1.x' }")
vim.cmd("Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }")

Plug 'machakann/vim-highlightedyank'

-- """ themes / styling
Plug 'nvim-lualine/lualine.nvim'
-- " If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'

Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'romgrk/doom-one.vim'
Plug 'EdenEast/nightfox.nvim'

vim.call('plug#end')
