set nocompatible
set incsearch
set hlsearch

syntax on
" filetype plugin indent on
filetype plugin on

"" plugins installed (using vim8)
" ack.vim
" ale
" emmet-vim
" fzf.vim
" nerdtree
" nerdtree-git-plugin
" tlib_vim
" vim-addon-mw-utils
" vim-airline
" vim-commentary
" vim-devicons
" vim-elixir
" vim-gitgutter
" vim-go
" vim-javascript
" vim-jsx
" vim-multiple-cursors
" vim-prettier
" vim-snipmate
" vim-surround
" vim-wakatime

set number
set expandtab
set smarttab
set shiftwidth=2
" set softtabstop=2
set tabstop=2

set ai
set si

set rtp+=/usr/local/opt/fzf

syntax on

" run prettier on save
let g:prettier#autoformat = 0
let g:prettier#config#print_width = 100
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#parser = 'babylon'
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md PrettierAsync

" status line settings
" use powerline fonts
let g:airline_powerline_fonts = 1
" always show the last status
set laststatus=2

" for devicons
set encoding=utf8
let g:airline_powerline_fonts = 1

" NERDTree
" open NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" shortcut to toggle
map <C-m> :NERDTreeToggle<CR>
" quit NERDTree when opening file
let NERDTreeQuitOnOpen = 1

command Bd bp\|bd \#

" only prefer to count using decimal and base 10 numbers
set nrformats=