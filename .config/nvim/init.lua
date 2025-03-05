vim.loader.enable()
vim.opt.termguicolors = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
  spec = {
    { "MunifTanjim/nui.nvim", lazy = true },
    { "rcarriga/nvim-notify", lazy = true },
    { "nvim-tree/nvim-web-devicons", lazy = true },
    { "nvim-lua/plenary.nvim", lazy = true },
    { "BurntSushi/ripgrep", lazy = true },
    { "sharkdp/fd", lazy = true },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", event = "BufReadPost" },
    { "folke/tokyonight.nvim", lazy = false, priority = 1000 },
    { "m4xshen/autoclose.nvim", event = "InsertEnter" },
    { "folke/noice.nvim", event = "VeryLazy" },
    { "akinsho/bufferline.nvim", event = "VeryLazy" },
    { "xeluxee/competitest.nvim", cmd = { "CompetiTest" } },
    { "nvim-telescope/telescope.nvim", cmd = "Telescope" },
    { "lukas-reineke/indent-blankline.nvim", event = "BufReadPost" },
    { "neovim/nvim-lspconfig", event = { "BufReadPre", "BufNewFile" } },
    { "hrsh7th/nvim-cmp", event = "InsertEnter" },
    { "hrsh7th/cmp-nvim-lsp", event = "InsertEnter" },
    { "L3MON4D3/LuaSnip", event = "InsertEnter" },
    { "saadparwaiz1/cmp_luasnip", event = "InsertEnter" },
    { "nvim-tree/nvim-tree.lua", cmd = { "NvimTreeToggle", "NvimTreeFocus" } },
    { "Pocco81/auto-save.nvim", event = { "InsertLeave", "TextChanged" } },
    { "nvimdev/dashboard-nvim", lazy = false, priority = 1000 },
    { "tiagovla/scope.nvim", event = "TabNew" },
    { "nvim-lualine/lualine.nvim", lazy = false, priority = 1000 },
    { "echasnovski/mini.icons", lazy = false, priority = 1000 },
    { "folke/snacks.nvim", lazy = false, priority = 1000 },
  },
  install = { colorscheme = { "tokyonight-night" } },
  checker = { enabled = true },
})

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
		['<Tab>'] = cmp.mapping.confirm({ select = true }),
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
require("lualine").setup {
	options = {
		disabled_filetypes = {
			statusline = {"dashboard", "NvimTree"},
		},
	},
}
require("telescope").setup()
require("auto-save").setup()
require("nvim-tree").setup()
require("autoclose").setup()
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
vim.api.nvim_set_keymap('n', '<C-A-r>', ':Com run <CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-s>', ':w <CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-s>', '<Esc> :w <CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-h>', ':split | terminal <CR>:hor res 10 <CR>i', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-v>', ':vsplit | terminal <CR>i', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'ff', ':Telescope fd <CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'fr', ':Telescope oldfiles <CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'ft', ':Telescope live_grep <CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-r>', ':Com receive problem <CR>', { noremap = true, silent = true })

