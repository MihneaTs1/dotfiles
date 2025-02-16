vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

-- Plugins

vim.cmd([[

call plug#begin()

Plug 'm4xshen/autoclose.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'xeluxee/competitest.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'folke/tokyonight.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'

call plug#end()
PlugInstall
q

]])

-- Options

require("autoclose").setup()
require("competitest").setup {
	received_problems_path = "$(HOME)/Documents/Programming/Competitive/$(JUDGE)/$(CONTEST)/$(PROBLEM)/main.$(FEXT)",
	received_contests_directory = "$(HOME)/Documents/Programming/Competitive/$(JUDGE)/$(CONTEST)",
	received_contests_problems_path = "$(PROBLEM)/main.$(FEXT)",
	compile_command = {
		cpp = { exec = "g++", args = { "-std=gnu++23", "-Wall", "-DLOCAL", "$(FNAME)", "-o", "$(FNOEXT)" } },
	},

	testcases_directory = "./.competitest",
	template_file = "$(HOME)/.config/nvim/template/template.cpp",
	evaluate_template_modifiers = true,
}
require("nvim-treesitter.configs").setup {
	highlight = {
		enable = true,
	},
}
require("nvim-tree").setup()
require("lualine").setup()

vim.o.tabstop=4
vim.o.shiftwidth=4
vim.o.number=true
vim.cmd([[
	set clipboard=unnamedplus
	colorscheme tokyonight-night
	NvimTreeOpen
]])
