vim.g.mapleader = ' '
local map = vim.keymap.set
local api = vim.api.nvim_set_keymap
local conform = require 'talonvim.plugins.lsp.formatting'

-- Editing
map('n', '<leader>q', '<cmd>q<cr>', { desc = 'quit buffer', noremap = true, silent = true })
map('n', '<leader>Q', '<cmd>qa!<cr>', { desc = 'quit talonvim', noremap = true, silent = true })
map('n', '<leader>C', '<cmd>Telescope find_files cwd=~/.config/nvim<CR>', { desc = 'configuration', noremap = true, silent = true })
map({ 'i', 'x', 'n', 's' }, '<leader>cs', '<cmd>w<cr><esc>', { desc = 'save file' })
map({ 'n', 'v' }, '<leader>cf', function()
  conform.format {
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  }
end, { desc = 'format' })

-- windows
map('n', '<leader>w-', '<cmd>sp<CR>', { desc = 'split across', remap = true })
map('n', '<leader>w|', '<cmd>vs<CR>', { desc = 'split down', remap = true })

-- tools
map('n', '<leader>tl', '<cmd>Lazy<CR>', { desc = ' lazy', noremap = true, silent = true })
map('n', '<leader>tm', '<cmd>Mason<CR>', { desc = ' mason', noremap = true, silent = true })
map('n', '<leader>to', '<cmd>Gen<CR>', { desc = ' ollama', noremap = true, silent = true })
api('n', '<leader>tj', '<cmd>JavaRunnerRunMain<CR>', { desc = ' java', noremap = true, silent = true })
map('n', '<leader>tu', "<cmd>lua require('undotree').toggle()<cr>", { desc = ' undotree', noremap = true, silent = true })
map('n', '<leader>tn', '<cmd>Neotree<cr>', { desc = ' neotree', noremap = true, silent = true })

-- =======================
-- Plugin Specific Keymaps
-- =======================

-- oil
map('n', '-', '<cmd>Oil<CR>', { desc = 'open parent directory' })

-- tmux
map('n', '<C-h>', '<C-w><C-h>', { desc = 'move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'move focus to the upper window' })

-- =======================
--    LazyVim  Keymaps
-- =======================

-- better up/down
map({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
map({ 'n', 'x' }, '<Down>', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
map({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })
map({ 'n', 'x' }, '<Up>', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })

-- move lines
map('n', '<A-j>', "<cmd>execute 'move .+' . v:count1<cr>==", { desc = 'Move Down' })
map('n', '<A-k>', "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = 'Move Up' })
map('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move Down' })
map('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move Up' })
map('v', '<A-j>', ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = 'Move Down' })
map('v', '<A-k>', ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = 'Move Up' })
