syntax on

set hidden
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
" absolute line numbers + relative line numbers
set nu rnu
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
" spellcheck
" setlocal spell spelllang=en_us

set incsearch
" highlight search
set hlsearch

" mine
filetype plugin on
set ai " autoindent
set si " smartindent
set ignorecase
set smartcase

" primeagean
set noerrorbells
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" set colorcolumn=80
" highlight ColorColumn ctermbg=0 guibg=lightgrey

" end primeagean


call plug#begin('~/.vim/plugged')

""" functionality
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'tpope/vim-commentary'
" Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'sethlowie/vim-test'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
" Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Git worktree
Plug 'ThePrimeagen/git-worktree.nvim'
" status bar
Plug 'hoob3rt/lualine.nvim'
Plug 'nvim-lua/popup.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

""" languages
"" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"" Rust
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
"" JS/TS
Plug 'pangloss/vim-javascript'
Plug 'peitalin/vim-jsx-typescript'
Plug 'leafgarland/typescript-vim'
"" Elm
Plug 'ElmCast/elm-vim'
"" Other
" Plug 'mustache/vim-mustache-handlebars'
" Plug 'rhysd/vim-crystal'
" Plug 'dleonard0/pony-vim-syntax'
" Plug 'IrenejMarc/vim-mint'
" Plug 'rescript-lang/vim-rescript'
"" svelte
Plug 'evanleck/vim-svelte', {'branch': 'main'}

""" utility
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jremmen/vim-ripgrep'
Plug 'mattn/emmet-vim'
Plug 'prettier/vim-prettier', { 'do': 'npm install', 'branch': 'release/1.x' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc', 'do': ':UpdateRemotePlugins'  }
" Plug 'chr4/nginx.vim'

Plug 'machakann/vim-highlightedyank'

""" themes / styling
" used in nerdtree
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'romgrk/doom-one.vim'
Plug 'EdenEast/nightfox.nvim'

""" games
" Plug 'ThePrimeagen/vim-be-good'

call plug#end()



let mapleader=" "


set rtp+=/usr/local/opt/fzf

" run prettier on save
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html,*.svelte PrettierAsync

" Set this variable to 1 to fix files when you save them.
" let g:ale_fix_on_save = 1
" let g:polyglot_disabled = ['elm']
" let g:elm_format_autosave = 1

" for devicons
set encoding=utf8
" status line settings
" use powerline fonts
let g:airline_powerline_fonts = 1
" always show the last status
set laststatus=2

" JSX plugin settings. allow both .js and .jsx
let g:jsx_ext_required = 0

" format {ex,exs} on save (mix format is available on elixir >= 1.6)
let g:mix_format_on_save = 1

" format rust on save
let g:rustfmt_autosave = 1

" NERDTree
autocmd StdinReadPre * let s:std_in=1
" quit NERDTree when opening file
let NERDTreeQuitOnOpen = 1
" enable line numbers
let NERDTreeShowLineNumbers = 1
" show hidden files
let NERDTreeShowHidden=1
" use relative line numbers
autocmd FileType nerdtree setlocal relativenumber
nnoremap <leader>n :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
" nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <leader><cr> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" only prefer to count using decimal and base 10 numbers
set nrformats=

" neovim settings
if (has("nvim"))
  " this helps neovim match the colors
  if (has("termguicolors"))
    set termguicolors
  endif

  " set background=dark
  " colorscheme palenight

  colorscheme one
  " colorscheme nightfox
  " colorscheme onedark
  " colorscheme doom-one
  " colorscheme neodark
  " colorscheme dracula
  set background=dark


  " set termguicolors     " enable true colors support
  " let ayucolor="light"  " for light version of theme
  " let ayucolor="mirage" " for mirage version of theme
  " let ayucolor="dark"   " for dark version of theme
  " colorscheme ayu

  " this prevent neovim from changing the cursor on insert mode
  set guicursor=
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1

  " colorscheme nord
  " let g:airline_theme='nord'
  " let g:oceanic_next_terminal_bold = 1
  " let g:oceanic_next_terminal_italic = 1
  " colorscheme OceanicNext
  " let g:airline_theme='oceanicnext'
  " https://github.com/mhartington/oceanic-next/issues/40
  " set t_ut=

  " CoC setup
  " Use tab for trigger completion with characters ahead and navigate.
  " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()

  " show the replacements
  set inccommand=nosplit

  nmap <leader>gd <Plug>(coc-definition)
  nmap <leader>gr <Plug>(coc-references)
  nmap <leader>rn <Plug>(coc-rename)
  " nmap <silent> <leader>gt <Plug>(coc-type-definition)
  nmap <silent> <Leader>v <Plug>(coc-fix-current)
  nnoremap <silent> <leader>gt :call <SID>show_documentation()<CR>
  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction
endif

" remaps
nnoremap Y y$

" keep it centered
nnoremap n nzzzv
nnoremap N Nzzzv
" nnoremap J mzJ`z

" jumplist mutation
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'

" moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

" #### VIM TEST MAPPINGS ####
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tg :TestVisit<CR>

" TYPESCRIPT STUFF
" autocmd FileType typescript.tsx nmap <buffer> <leader>gt :<C-u>echo tsuquyomi#hint()<CR>
" autocmd FileType typescript nmap <buffer> <leader>gt :<C-u>echo tsuquyomi#hint()<CR>

" coc-tsserver has been giving linting errors. `:set ft` revealed that it
" thought the filetype was "typescript" instead of "typescriptreact"
augroup ReactFiletypes
  autocmd!
  autocmd BufRead,BufNewFile *.jsx set filetype=javascriptreact
  autocmd BufRead,BufNewFile *.tsx set filetype=typescriptreact
augroup END

" Elm stuff
autocmd FileType elm setlocal shiftwidth=4 softtabstop=4 expandtab

" install coc plugins on update/install
let g:coc_global_extensions = [
      \ 'coc-css',
      \ 'coc-emmet',
      \ 'coc-eslint',
      \ 'coc-go',
      \ 'coc-html',
      \ 'coc-json',
      \ 'coc-fzf-preview',
      \ 'coc-prettier',
      \ 'coc-rls',
      \ 'coc-tailwindcss',
      \ 'coc-tslint-plugin',
      \ 'coc-tsserver',
      \ 'coc-yank',
      \ ]

" noremap <C-p> :GFiles<CR>
" nnoremap <C-p> :CocCommand fzf-preview.DirectoryFiles <Cr>
" Telescope
nnoremap <C-p> <cmd>Telescope find_files<cr>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" same as above, but using Lua
" nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
" nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
" nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
" nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
" :lua require('telescope').load_extension('fzf')

" GIT
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gc :Gcommit -v<CR>
nmap <leader>gs :G<CR>

nmap <silent> <Leader>af :CocCommand eslint.executeAutofix<CR>

" move selected lines up/down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Find
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" if executable('rg')
"   let g:rg_derive_root='true'
" endif

" git worktree
" nvim_set_keymap('n', '<Leader>w', ':lua require("telescope").extensions.git_worktree.git_worktrees()<CR>', { noremap = true })
" nvim_set_keymap('n', '<Leader>nw', ':lua require("telescope").extensions.git_worktree.create_git_worktree()<CR>', { noremap = true })
nnoremap <leader>w :lua require("telescope").extensions.git_worktree.git_worktrees()<cr>
nnoremap <leader>nw :lua require("telescope").extensions.git_worktree.create_git_worktree()<cr>

" syntax highlighting
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
