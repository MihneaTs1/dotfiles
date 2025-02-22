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
	Plug 'nvimdev/dashboard-nvim'
	Plug 'tiagovla/scope.nvim'

	call plug#end()
	
	PlugInstall
	PlugUpdate
	PlugUpgrade
	q
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
require('dashboard').setup({
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
    		{
    			icon = "  ",
			    desc = "New File                ",
				action = "enew",
				key = 'n',
				key_format = ' %s',
			},
			{
    			icon = "  ",
				desc = "Open File                                ",
				action = "Telescope find_files",
				key = 'ff',
				key_format = ' %s',
			},
    		{
				icon = "  ",
				desc = "Recent Files                                ",
				action = "Telescope oldfiles",
				key = 'fr',
				key_format = ' %s',
			},
			{
        		icon = "  ",
        		desc = "Find Text                               ",
        		action = "Telescope live_grep",
				key = 'ft',
				key_format = ' %s',
			},
			{
				icon = "  ",
        		desc = "Config                                ",
				action = "Telescope find_files cwd=~/.config/nvim",
				key = 'c',
				key_format = ' %s',
			},
			{
				icon = "  ",
				desc = "Quit                ",
				action = "qa",
				key = 'q',
				key_format = ' %s',
			}
    	},
    	footer = {
			'https://github.com/MihneaTs1/dotfiles'
		}
	}
})

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
	exclude = {
		filetypes = {
			'dashboard',
    	},
		buftypes = {
			'nofile',
			'terminal',
		},
	},
}
require("bufferline").setup {
	options = {
		mode = "buffers",
	},
}
require("telescope").setup()
require("auto-save").setup()
require("nvim-tree").setup()
require("autoclose").setup()
require("lualine").setup()
require("noice").setup()
require("scope").setup()

-- Options

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus" 
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.lazyredraw = true
vim.cmd[[colorscheme tokyonight-night]]
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=150}
  augroup end
]]

vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-S-r>', ':Com run <CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-s>', ':w <CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-s>', '<Esc> :w <CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-h>', ':split | terminal <CR>:hor res 10 <CR>i', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-v>', ':vsplit | terminal <CR>i', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'ff', ':Telescope fd <CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'fr', ':Telescope oldfiles <CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'ft', ':Telescope live_grep <CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-r>', ':Com receive problem <CR>', { noremap = true, silent = true })

