require("config.lazy")

-- Options

local opt = vim.opt
local o = vim.o
local g = vim.g
local a = vim.api

o.tabstop = 4
o.shiftwidth = 4
o.clipboard = "unnamedplus" 
o.splitbelow = true
o.splitright = true
o.cursorline = true
o.cursorlineopt = "number"
vim.cmd [[
	augroup YankHighlight
		autocmd!
		autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=150}
	augroup end
]]

a.nvim_set_keymap('n', '<C-n>', ':Neotree toggle reveal=true<CR>', { noremap = true, silent = true })
a.nvim_set_keymap('n', '<C-A-r>', ':Com run<CR>', { noremap = true, silent = true })
a.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })
a.nvim_set_keymap('i', '<C-s>', '<Esc> :w<CR>', { noremap = true, silent = true })
a.nvim_set_keymap('n', 'ff', ':Telescope fd<CR>', { noremap = true, silent = true })
a.nvim_set_keymap('n', 'fr', ':Telescope oldfiles<CR>', { noremap = true, silent = true })
a.nvim_set_keymap('n', 'ft', ':Telescope live_grep<CR>', { noremap = true, silent = true })
a.nvim_set_keymap('n', '<A-r>', ':Com receive problem<CR>', { noremap = true, silent = true })
a.nvim_set_keymap('n', '<A-h>', ':ToggleTerm<CR>', { noremap = true, silent = true })

vim.cmd [[
	set number
	set relativenumber
]]
