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
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvimdev/dashboard-nvim'

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
require('dashboard').setup({
  theme = 'doom',
  config = {
    header = {
	  "",
	  "",
 	  ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
	  ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
	  ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
	  ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
	  ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
	  ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
      "",
	  "",
  },
    center = {
      {
        icon = ' ',
        icon_hl = 'Title',
        desc = 'Find File',
        desc_hl = 'String',
        key = 'f',
        keymap = 'Telescope find_files',
        key_hl = 'Number',
        key_format = ' %s',  -- This removes the default surrounding brackets
        action = 'Telescope find_files',
      },
      {
        icon = ' ',
        icon_hl = 'Title',
        desc = 'Recent Files',
        desc_hl = 'String',
        key = 'r',
        keymap = 'Telescope oldfiles',
        key_hl = 'Number',
        key_format = ' %s',
        action = 'Telescope oldfiles',
      },
      {
        icon = ' ',
        icon_hl = 'Title',
        desc = 'Edit Config',
        desc_hl = 'String',
        key = 'c',
        keymap = 'edit ~/.config/nvim/init.lua',
        key_hl = 'Number',
        key_format = ' %s',
        action = 'edit ~/.config/nvim/init.lua',
      },
    },
    footer = {
      "Happy Coding!",
      "https://github.com/nvimdev/dashboard-nvim",
    },
  },
})
require("telescope").setup()


vim.o.tabstop=4
vim.o.shiftwidth=4
vim.o.number=true
vim.cmd([[
	set clipboard=unnamedplus
	colorscheme tokyonight-night
	set noshowmode
]])
