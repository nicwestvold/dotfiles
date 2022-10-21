require("settings")
require("plugins")

local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig').tsserver.setup({
    capabilities = capabilities,
  })
require'lspconfig'.svelte.setup{}
require'lspconfig'.tailwindcss.setup{}
-- require'lspconfig'.rust_analyzer.setup{}
require'lspconfig'.gopls.setup{}
-- require'lspconfig'.elmls.setup{}
-- require'lspconfig'.dockerls.setup{}

require('lspsaga').init_lsp_saga()

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "css", "go", "html", "javascript", "json", "scss", "svelte", "tsx", "typescript", "yaml" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  -- ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- -- the name of the parser)
    -- -- list of language that will be disabled
    -- disable = { "c", "rust" },
    -- -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    -- disable = function(lang, buf)
    --     local max_filesize = 100 * 1024 -- 100 KB
    --     local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    --     if ok and stats and stats.size > max_filesize then
    --         return true
    --     end
    -- end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

vim.o.completeopt = "menu,menuone,noselect"

local cmp = require('cmp')
cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

vim.g.mapleader = " "

vim.cmd([[
    set rtp+=/usr/local/opt/fzf

    " run prettier on save
    let g:prettier#autoformat = 0
    autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html,*.svelte PrettierAsync
]])

-- NvimTree
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- empty setup using defaults
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
    number = true,
    relativenumber = true,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
  -- using the 's' key will open the file using the system default to open that type of file
  system_open = {
    cmd = "",
  },
})

vim.keymap.set('n', '<leader><cr>', ':NvimTreeToggle<CR>', { noremap = true })
vim.keymap.set('n', '<leader>n', ':NvimTreeFocus<CR>', { noremap = true })
vim.keymap.set('n', '<C-f>', ':NvimTreeFindFile<CR>', { noremap = true })

require('lualine').setup {
  options = { theme = 'ayu_mirage' },
}

-- GitLens
-- vim.api.nvim_create_autocmd("CursorHold", {
--     pattern = { "*" },
--     command = "lua require'gitblame'.blameVirtText()",
-- })
-- vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
--     pattern = { "*" },
--     command = "lua require'gitblame'.clearBlameVirtText()",
-- })

-- " for devicons
vim.o.encoding = 'utf8'

-- " always show the last status
vim.o.laststatus = 2

-- " JSX plugin settings. allow both .js and .jsx
vim.g.jsx_ext_required = 0
-- " format {ex,exs} on save (mix format is available on elixir >= 1.6)
-- let g:mix_format_on_save = 1
vim.g.mix_format_on_save = 1
-- " format rust on save
vim.g.rustfmt_autosave = 1

-- only prefer to count using decimal and base 10 numbers
-- set nrformats=
vim.o.nrformats = ''

vim.cmd([[
      " this helps neovim match the colors
      if (has("termguicolors"))
        set termguicolors
      endif

      colorscheme one
      set background=dark

      " this prevent neovim from changing the cursor on insert mode
      set guicursor=
      let $NVIM_TUI_ENABLE_TRUE_COLOR=1

      "" " CoC setup
      "" " Use tab for trigger completion with characters ahead and navigate.
      "" " NOTE: There's always complete item selected by default, you may want to enable
      "" " no select by `"suggest.noselect": true` in your configuration file.
      "" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
      "" " other plugin before putting this into your config.
      "" inoremap <silent><expr> <TAB>
      ""       \ coc#pum#visible() ? coc#pum#next(1) :
      ""       \ CheckBackspace() ? "\<Tab>" :
      ""       \ coc#refresh()
      "" inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
      "" 
      "" " Make <CR> to accept selected completion item or notify coc.nvim to format
      "" " <C-g>u breaks current undo, please make your own choice.
      "" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
      ""                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
      "" 
      "" function! CheckBackspace() abort
      ""   let col = col('.') - 1
      ""   return !col || getline('.')[col - 1]  =~# '\s'
      "" endfunction
      "" 
      "" " Use <c-space> to trigger completion.
      ""   inoremap <silent><expr> <c-space> coc#refresh()
      "" 
      "" " Use `[g` and `]g` to navigate diagnostics
      "" " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
      "" nmap <silent> [g <Plug>(coc-diagnostic-prev)
      "" nmap <silent> ]g <Plug>(coc-diagnostic-next)
]])

-- -- GoTo code navigation.
-- vim.keymap.set('n', '<leader>gd', '<Plug>(coc-definition)', {})
-- vim.keymap.set('n', '<leader>gt', '<Plug>(coc-type-definition)', {})
-- vim.keymap.set('n', '<leader>gi', '<Plug>(coc-implementation)', {})
-- vim.keymap.set('n', '<leader>gr', '<Plug>(coc-references)', {})
-- vim.keymap.set('n', '<leader>v', '<Plug>(coc-fix-current)', {})

local nvim_set_keymap = vim.api.nvim_set_keymap

nvim_set_keymap('n', '<Leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
nvim_set_keymap('n', '<Leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true })
nvim_set_keymap('n', '<Leader>rr', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })

-- CHECK COVERAGE
-- nvim_set_keymap('n', '<Leader>ff', '<cmd>! npm run check-coverage<CR>', { noremap = true })

-- PREV/NEXT
-- nvim_set_keymap('n', '<Leader>nn', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
-- nvim_set_keymap('n', '<Leader>NN', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })

nvim_set_keymap('n', '<Leader>af', '<cmd>lua vim.lsp.buf.formatting_sync()<CR>', { noremap = true, silent = true })
nvim_set_keymap('n', '<Leader>gt', ':Lspsaga hover_doc<CR>', { noremap = true, silent = true })
nvim_set_keymap('n', '<Leader>gh', ':Lspsaga code_action<CR>', { noremap = true, silent = true })
-- nvim_set_keymap('i', '<Leader>c', 'compe#complete()', { noremap = true, silent = true, expr = true })

vim.cmd([[
      "" function! ShowDocumentation()
      ""   if CocAction('hasProvider', 'hover')
      ""     call CocActionAsync('doHover')
      ""   else
      ""     call feedkeys('K', 'in')
      ""   endif
      "" endfunction
      "" " Use K to show documentation in preview window.
      "" nnoremap <silent> K :call ShowDocumentation()<CR>
      "" 
      "" " Highlight the symbol and its references when holding the cursor.
      "" autocmd CursorHold * silent call CocActionAsync('highlight')
      "" 
      "" " Symbol renaming.
      "" nmap <leader>rn <Plug>(coc-rename)

      "" " Use <c-space> to trigger completion.
      "" inoremap <silent><expr> <c-space> coc#refresh()

      " show the replacements
      set inccommand=nosplit

    " keep it centered
    nnoremap n nzzzv
    nnoremap N Nzzzv
    " nnoremap J mzJ`z

    " jumplist mutation
    nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
    nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'

    "" " coc-tsserver has been giving linting errors. `:set ft` revealed that it
    "" " thought the filetype was "typescript" instead of "typescriptreact"
    "" augroup ReactFiletypes
    ""   autocmd!
    ""   autocmd BufRead,BufNewFile *.jsx set filetype=javascriptreact
    ""   autocmd BufRead,BufNewFile *.tsx set filetype=typescriptreact
    "" augroup END

    " Elm stuff
    autocmd FileType elm setlocal shiftwidth=4 softtabstop=4 expandtab
]])

-- Moving text
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true})
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true})
vim.keymap.set('i', '<C-j>', "<esc>:m .+1<CR>==", { noremap = true })
vim.keymap.set('i', '<C-k>', "<esc>:m .-2<CR>==", { noremap = true })
vim.keymap.set('n', '<leader>j', ":m .+1<CR>==", { noremap = true })
vim.keymap.set('n', '<leader>k', ":m .-2<CR>==", { noremap = true })

-- " #### VIM TEST MAPPINGS ####
vim.keymap.set('n', '<leader>tn', ":TestNearest<CR>", { silent = true })
vim.keymap.set('n', '<leader>tf', ":TestFile<CR>", { silent = true })
vim.keymap.set('n', '<leader>ts', ":TestSuite<CR>", { silent = true })
vim.keymap.set('n', '<leader>tl', ":TestLast<CR>", { silent = true })
vim.keymap.set('n', '<leader>tg', ":TestVisit<CR>", { silent = true })

-- -- CoC - install coc plugins on update/install
-- vim.cmd([[
--       let g:coc_global_extensions = [
--           \ 'coc-css',
--           \ 'coc-emmet',
--           \ 'coc-eslint',
--           \ 'coc-go',
--           \ 'coc-html',
--           \ 'coc-json',
--           \ 'coc-fzf-preview',
--           \ 'coc-prettier',
--           \ 'coc-rls',
--           \ 'coc-tailwindcss',
--           \ 'coc-tslint-plugin',
--           \ 'coc-tsserver',
--           \ 'coc-yank',
--           \ ]

--       nmap <silent> <Leader>af :CocCommand eslint.executeAutofix<CR>
-- ]])

-- Find
vim.cmd([[command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)]])

-- syntax highlighting
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.{js,jsx,ts,tsx}" },
    command = "syntax sync fromstart",
})
vim.api.nvim_create_autocmd("BufLeave", {
    pattern = { "*.{js,jsx,ts,tsx}" },
    command = "syntax sync clear",
})

vim.keymap.set('n', 'Y', 'y$', {noremap = true})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, { noremap = true })
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
require('telescope').load_extension('fzf')

-- " nnoremap <leader>w :lua require("telescope").extensions.git_worktree.git_worktrees()<cr>
vim.keymap.set('n', '<leader>w', require("telescope").extensions.git_worktree.git_worktrees, {})
-- " nnoremap <leader>nw :lua require("telescope").extensions.git_worktree.create_git_worktree()<cr>
vim.keymap.set('n', '<leader>nw', require("telescope").extensions.git_worktree.create_git_worktree, {})
