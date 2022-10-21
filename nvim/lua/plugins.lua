local Plug = vim.fn['plug#']

-- vim.call('plug#begin', '~/.config/nvim/plugged')
vim.call('plug#begin', '~/.vim/plugged')

-- """ functionality
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

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
Plug 'pangloss/vim-javascript'
Plug 'peitalin/vim-jsx-typescript'
Plug 'leafgarland/typescript-vim'
-- "" Elm
Plug 'ElmCast/elm-vim'
-- "" svelte
vim.cmd("Plug 'evanleck/vim-svelte', {'branch': 'main'}")

-- """ utility
vim.cmd("Plug 'neoclide/coc.nvim', {'branch': 'release'}")
Plug 'jremmen/vim-ripgrep'
Plug 'mattn/emmet-vim'
vim.cmd("Plug 'prettier/vim-prettier', { 'do': 'npm install', 'branch': 'release/1.x' }")
vim.cmd("Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }")

Plug 'machakann/vim-highlightedyank'

-- """ themes / styling
-- " used in nerdtree
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'romgrk/doom-one.vim'
Plug 'EdenEast/nightfox.nvim'

-- """ games
-- " Plug 'ThePrimeagen/vim-be-good'

vim.call('plug#end')
