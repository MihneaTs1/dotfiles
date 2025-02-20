vim.opt.termguicolors = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Plugins
vim.cmd
[[

call plug#begin()

Plug 'MunifTanjim/nui.nvim'
Plug 'rcarriga/nvim-notify'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-lua/plenary.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'folke/tokyonight.nvim'
Plug 'folke/noice.nvim'
Plug 'nvimdev/dashboard-nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
Plug 'm4xshen/autoclose.nvim'
Plug 'xeluxee/competitest.nvim'
Plug 'nvim-tree/nvim-tree.lua'

call plug#end()

PlugInstall
q

]]

require("autoclose").setup()
require("bufferline").setup{}
require("lualine").setup()
require("telescope").setup()
require("noice").setup()
require("dashboard").setup({
	theme = 'doom',
	config = {
		header = {
			'',
			'',
			' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
			' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
			' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
			' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
			' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
			' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',	
			'',
			'',	
		},
    	center = {
      		{ icon = " ", desc = "Find File                            ",      key = "f", action = "Telescope find_files", key_format = "%s" },
    		{ icon = " ", desc = "New File                            ",       key = "n", action = "enew", key_format = "%s" },
		{ icon = " ", desc = "Recieve Problem                      ", key = "p", action = "Com receive problem", key_format = "%s" },
     		{ icon = " ", desc = "Recent Files                            ",   key = "r", action = "Telescope oldfiles", key_format = "%s" },
      		{ icon = " ", desc = "Find Text                            ",      key = "t", action = "Telescope live_grep", key_format = "%s" },
      		{ icon = " ", desc = "Config                            ",         key = "c", action = "edit ~/.config/nvim/init.lua", key_format = "%s" },
      		{ icon = " ", desc = "Quit                            ",           key = "q", action = "qa", key_format = "%s" },
    	},
    	footer = { "https://github.com/MihneaTs1/dotfiles" },
	},
})
require("nvim-tree").setup()
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

vim.cmd
[[

set tabstop=4
set shiftwidth=4
set number
colorscheme tokyonight-night
set clipboard=unnamedplus

]]
