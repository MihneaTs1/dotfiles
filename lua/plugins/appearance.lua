-- lua/config/plugins/appearance.lua
return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme tokyonight-night")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
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
    "nvimdev/dashboard-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
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
            "",
          },
          center = {
            {
              icon = "  ",
              desc = "New File                ",
              action = "enew",
              key = "n",
              key_format = " %s",
            },
            {
              icon = "  ",
              desc = "Open File                                ",
              action = "Telescope find_files",
              key = "ff",
              key_format = " %s",
            },
            {
              icon = "  ",
              desc = "Recent Files                                ",
              action = "Telescope oldfiles",
              key = "fr",
              key_format = " %s",
            },
            {
              icon = "  ",
              desc = "Find Text                               ",
              action = "Telescope live_grep",
              key = "ft",
              key_format = " %s",
            },
            {
              icon = "  ",
              desc = "Config                                ",
              action = "Telescope find_files cwd=~/.config/nvim",
              key = "c",
              key_format = " %s",
            },
            {
              icon = "  ",
              desc = "Quit                ",
              action = "qa",
              key = "q",
              key_format = " %s",
            },
          },
          footer = {
            "https://github.com/MihneaTs1/dotfiles",
          },
        },
      }
      vim.api.nvim_set_keymap("n", "<C-S-d>", ":Dashboard<CR>", { noremap = true, silent = true })
    end,
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      { "3rd/image.nvim", opts = {} },
    },
    config = function()
      vim.api.nvim_set_keymap("n", "<C-n>", ":Neotree toggle right reveal=true<CR>", { noremap = true, silent = true })
    end,
  },
  {
    "folke/snacks.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "folke/trouble.nvim",
    lazy = true,
    cmd = "Trouble",
    opts = {},
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "ibhagwan/fzf-lua" },
    opts = {},
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    config = function()
      require("noice").setup {
        views = {
          cmdline_popup = {
            position = {
              row = -1,
              col = 2,
            },
          },
        },
      }
    end,
  },
  {
    "REslim30/vim-smoothie",
  },
}

