-- lua/config/plugins/lsp.lua
return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    priority = 1000,
    config = function()
      local lspconfig = require("lspconfig")
      -- Setup clangd with custom init options
      lspconfig.clangd.setup {
        init_options = {
          fallbackFlags = { "-std=gnu++23", "-Wall", "-DLOCAL", "-Wno-unknown-pragmas", "-Wno-unused-variable" },
        },
        capabilities = capabilities,  -- assumes 'capabilities' is defined elsewhere
      }
      -- Setup Python LSP (pyright)
      lspconfig.pyright.setup {
        capabilities = capabilities,
      }
    end,
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        automatic_installation = true,
      })
    end,
  },
  {
    "MihneaTs1/competibest.nvim",
    dependencies = "MunifTanjim/nui.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("competibest").setup {
        save_current_file = true,
        compile_directory = ".",
        compile_command = {
          cpp = { exec = "g++", args = { "-std=gnu++23", "-Wall", "-DLOCAL", "$(FNAME)", "-o", "$(FNOEXT)" } },
        },
        runner_ui = {
          interface = "popup",
        },
        view_output_diff = false,
        testcases_directory = "./.competibest",
        testcases_use_single_file = false,
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
      vim.api.nvim_set_keymap("n", "<C-A-r>", ":Competibest run<CR>", { noremap = true, silent = true })
    end,
  },
  {
    "okuuva/auto-save.nvim",
    event = { "InsertLeave", "TextChanged" },
    config = function()
      require("auto-save").setup {
        message = nil,
      }
    end,
  },
  {
    "BurntSushi/ripgrep",
    lazy = true,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
    },
    lazy = false,
    priority = 1000,
    config = function()
      local cmp = require("cmp")
      cmp.setup {
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = {
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<Tab>"] = cmp.mapping.confirm({ select = true }),
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
        },
      }
    end,
  },
  {
    "m4xshen/autoclose.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("autoclose").setup()
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup {
        exclude = {
          filetypes = { "dashboard" },
          buftypes = { "terminal", "nofile" },
        },
      }
    end,
  },
}

