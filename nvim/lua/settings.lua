-- settings
vim.cmd('syntax on')

vim.o.hidden = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smarttab = true
-- absolute line numbers + relative line numbers
vim.o.number = true
vim.o.relativenumber = true

-- vim.cmd([[
--     augroup numbertoggle
--       autocmd!
--       autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
--       autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
--     augroup END
-- ]])

local numberToggle = vim.api.nvim_create_augroup("numbertoggle", { clear = true })
vim.api.nvim_create_autocmd(
    { "BufEnter", "FocusGained", "InsertLeave" }, {
  command = "set relativenumber",
  group = numberToggle,
})
vim.api.nvim_create_autocmd(
    { "BufLeave", "FocusLost", "InsertEnter" }, {
  command = "set norelativenumber",
  group = numberToggle,
})

vim.o.incsearch = true -- shows the match while typing
vim.o.hlsearch = true -- highlight found searches

vim.cmd('filetype plugin on')

vim.o.autoindent = true
vim.o.smartindent = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- " primeagean
vim.o.noerrorbells = true
vim.o.nowrap = true
vim.o.noswapfile = true
vim.o.nobackup = true
vim.o.nowritebackup = true
-- vim.o.undodir = "~/.vim/undodir"
vim.cmd("set undodir=~/.vim/undodir")
vim.o.undofile = true

-- Give more space for displaying messages.
vim.o.cmdheight = 2

-- " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- " delays and poor user experience.
vim.o.updatetime = 50

-- Always show the signcolumn, otherwise it would shift the text each time diagnostics appear/become resolved.
vim.o.signcolumn = 'yes'
