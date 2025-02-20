vim.opt.termguicolors = true

-- Plugins

vim.cmd([[
	call plug#begin()

	Plug 'MunifTanjim/nui.nvim'
	Plug 'rcarriga/nvim-notify'
	Plug 'nvim-tree/nvim-web-devicons'

	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'folke/tokyonight.nvim'
	Plug 'm4xshen/autoclose.nvim'
	Plug 'folke/noice.nvim'
	Plug 'nvim-lualine/lualine.nvim'
	Plug 'akinsho/bufferline.nvim'
	Plug 'xeluxee/competitest.nvim'

	call plug#end()

	PlugInstall
	PlugUpdate
	PlugUpgrade
	q
]])

require("nvim-treesitter.configs").setup {
	ensure_installed = {"c", "cpp", "lua", "vim", "python"},
	sync_install = true,
	auto_install = true,
	highlight = {
		additional_vim_regex_highlighting = true,
	}
}
require("bufferline").setup()
require("autoclose").setup()
require("lualine").setup()
require("noice").setup()
require("competitest").setup {
	save_current_file = false,
	compile_directory = ".",
	compile_command = {
		cpp = { exec = "g++", args = { "-std=gnu++23", "-Wall", "-DLOCAL", "$(FNAME)", "-o", "$(FNOEXT)" } },
	},
	view_output_diff = true,
	
	testcases_directory = "./.competitest",
	testcases_use_single_file = true,
	
	recieve_print_message = false,
	template_file = "$(HOME)/.config/nvim/template/template.cpp",
	evaluate_template_modifiers = true,
	received_problems_path = "$(HOME)/Documents/Programming/Competititve/$(JUDGE)/$(CONTEST)/$(PROBLEM)/main.$(FEXT)",
	received_problems_prompt_path = false,
	received_contests_directory = "$(HOME)/Documents/Programming/Competitive/$(JUDGE)/$(CONTEST)",
	received_contests_problems_path = "$(PROBLEM)/main.$(FEXT)",
	received_contests_prompt_directory = false,
	received_contests_prompt_extension = false,
}

-- Options
local o = vim.o
local g = vim.g
o.tabstop = 4
o.shiftwidth = 4
o.laststatus = 3
o.number = true
o.relativenumber = true
o.clipboard = "unnamedplus"

vim.cmd([[
	colorscheme tokyonight-night
]])
