-- Lazy Config
require("config.lazy")

-- Options
vim.cmd[[
	set tabstop=4
	set shiftwidth=4
	set number
	set relativenumber
	set clipboard=unnamedplus
	set cursorline
	set cursorlineopt=number
	Neotree toggle right
]]

-- Highlight on copy
vim.cmd [[
	augroup YankHighlight
		autocmd!
		autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=150}
	augroup end
]]
