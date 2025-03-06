return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd [[colorscheme tokyonight-night]]
        end
    },
    {
        "folke/snacks.nvim",
        lazy = false,
        priority = 1000,
        opts = {}
    },
    {
        "folke/trouble.nvim",
        lazy = true,
        cmd = "Trouble",
        opts = {}
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        lazy = true,
        config = function()
            require("nvim-treesitter.configs").setup(
                {
                    sync_install = true,
                    auto_install = true,
                    highlight = {enable = true},
                    indent = {enable = true},
                    additional_vim_regex_highlighting = true
                }
            )
        end
    },
    {
        "folke/ts-comments.nvim",
        opts = {},
        event = "VeryLazy",
        enabled = vim.fn.has("nvim-0.10.0") == 1
    },
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        opts = {}
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {}
    },
    {
        "folke/todo-comments.nvim",
        dependencies = {"nvim-lua/plenary.nvim", "ibhagwan/fzf-lua"},
        opts = {}
    },
	{
		"L3MON4D3/LuaSnip",
		build = "make install_jsregexp",
	},
    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        config = function()
            require("dashboard").setup {
                theme = "doom",
                config = {
                    header = {
                        "",
                        "",
                        " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
                        " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
                        " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
                        " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
                        " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
                        " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
                        "",
                        ""
                    },
                    center = {
                        {
                            icon = "  ",
                            desc = "New File                ",
                            action = "enew",
                            key = "n",
                            key_format = " %s"
                        },
                        {
                            icon = "  ",
                            desc = "Open File                                ",
                            action = "Telescope find_files",
                            key = "ff",
                            key_format = " %s"
                        },
                        {
                            icon = "  ",
                            desc = "Recent Files                                ",
                            action = "Telescope oldfiles",
                            key = "fr",
                            key_format = " %s"
                        },
                        {
                            icon = "  ",
                            desc = "Find Text                               ",
                            action = "Telescope live_grep",
                            key = "ft",
                            key_format = " %s"
                        },
                        {
                            icon = "  ",
                            desc = "Config                                ",
                            action = "Telescope find_files cwd=~/.config/nvim",
                            key = "c",
                            key_format = " %s"
                        },
                        {
                            icon = "  ",
                            desc = "Quit                ",
                            action = "qa",
                            key = "q",
                            key_format = " %s"
                        }
                    },
                    footer = {
                        "https://github.com/MihneaTs1/dotfiles"
                    }
                }
            }
        end,
        dependencies = {{"nvim-tree/nvim-web-devicons"}}
    },
	{
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {},
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify"
        }
    },
	{
  		"neovim/nvim-lspconfig",
  		config = function()
    		require("lspconfig").clangd.setup {
				init_options = {
					fallbackFlags = { "-std=gnu++23", "-Wall", "-DLOCAL", "-Wno-unknown-pragmas", "-Wno-unused-variable" },
				},
				capabilities = capabilities,
			}
			require("lspconfig").pyright.setup {
				capabilities = capabilities,
			}
  		end
	},
	{
		"williamboman/mason.nvim",
  		config = function()
    		require("mason").setup()
  		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
  		config = function()
    		require("mason-lspconfig").setup({
      			automatic_installation = true,
    		})
  		end
	},
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' }
    },
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup {}
		end
	},
	{
		"xeluxee/competitest.nvim",
		dependencies = 'MunifTanjim/nui.nvim',
		config = function() 
			require('competitest').setup {
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
		end,
	},
	{
		"pocco81/auto-save.nvim",
		opts = {},
		event = "VeryLazy",
	},
	{ 
		"BurntSushi/ripgrep", 
		lazy = true, 
	},
	{
		"akinsho/bufferline.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		requires = {
    		"nvim-lua/plenary.nvim",
    		"nvim-tree/nvim-web-devicons",    			
			"MunifTanjim/nui.nvim",  
		},
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-cmdline" },
		lazy = false,
		priority = 1000,
		config = function()
			local cmp = require'cmp'
			cmp.setup {
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
			}
		end,
	},
	{
		'nvim-lualine/lualine.nvim',
    	dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require("lualine").setup {
				options = {
					disabled_filetypes = {
						statusline = { "dashboard", "neo-tree" },
					},
				},
			}
		end,
	},
	{
		'akinsho/toggleterm.nvim', 
		version = "*", 
		config = true,
	}
}

