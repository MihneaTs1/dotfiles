vim.loader.enable()
vim.opt.termguicolors = true

-- Plugins

vim.cmd([[
	call plug#begin()

	" Dependencies
	Plug 'MunifTanjim/nui.nvim'
	Plug 'rcarriga/nvim-notify'
	Plug 'nvim-tree/nvim-web-devicons'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'BurntSushi/ripgrep'
	Plug 'sharkdp/fd'
	" Plugins
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'folke/tokyonight.nvim'
	Plug 'm4xshen/autoclose.nvim'
	Plug 'folke/noice.nvim'
	Plug 'nvim-lualine/lualine.nvim'
	Plug 'akinsho/bufferline.nvim'
	Plug 'xeluxee/competitest.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'lukas-reineke/indent-blankline.nvim'
	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'L3MON4D3/LuaSnip'
	Plug 'saadparwaiz1/cmp_luasnip'
	Plug 'nvim-tree/nvim-tree.lua'
	Plug 'Pocco81/auto-save.nvim'

	call plug#end()
	
	PlugUpgrade
	PlugInstall | q
	PlugUpdate | q
]])

local cmp = require('cmp')
cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
	end,
	},
	mapping = {
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-Space>'] = cmp.mapping.complete(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	},
})
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')
lspconfig.clangd.setup({
	init_options = {
		fallbackFlags = { "-std=gnu++23", "-Wall", "-DLOCAL", "-Wno-unknown-pragmas", "-Wno-unused-variable" },
	},
	capabilities = capabilities,
})
lspconfig.pyright.setup {
	capabilities = capabilities,
}
require("competitest").setup {
	save_current_file = false,
	compile_directory = ".",
	compile_command = {
		cpp = { exec = "g++", args = { "-std=gnu++23", "-Wall", "-DLOCAL", "$(FNAME)", "-o", "$(FNOEXT)" } },
	},
	runner_ui =  {
		interface = "popup",
	},
	view_output_diff = false,
	testcases_directory = "./.competitest",
	testcases_use_single_file = true,
	recieve_print_message = false,
	template_file = "$(HOME)/.config/nvim/template/template.cpp",
	evaluate_template_modifiers = true,
	received_problems_path = "$(HOME)/Documents/Programming/Competitive/$(JUDGE)/$(CONTEST)/$(PROBLEM)/main.$(FEXT)",
	received_problems_prompt_path = false,
	received_contests_directory = "$(HOME)/Documents/Programming/Competitive/$(JUDGE)/$(CONTEST)",
	received_contests_problems_path = "$(PROBLEM)/main.$(FEXT)",
	received_contests_prompt_directory = false,
	received_contests_prompt_extension = false,
}
require("nvim-treesitter.configs").setup {
	ensure_installed = {"c", "cpp", "lua", "vim", "python"},
	sync_install = true,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	}
}
require("ibl").setup {
	scope = {
		enabled = false,
	},
}
require("telescope").setup()
require("auto-save").setup()
require("bufferline").setup()
require("nvim-tree").setup()
require("autoclose").setup()
require("lualine").setup()
require("noice").setup()

-- Options

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus" 
vim.opt.splitbelow = true
vim.o.splitright = true
vim.cmd[[colorscheme tokyonight-night]]

vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-S-r>', ':Com run <CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-s>', ':w <CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-s>', '<Esc> :w <CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-h>', ':split | terminal <CR>i', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-v>', ':vsplit | terminal <CR>i', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'ff', ':Telescope find_files <CR>', { noremap = true, silent = true })
