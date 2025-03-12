-- lua/config/plugins/utility.lua
return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    priority = 1000,
    config = function()
      require("nvim-treesitter.configs").setup {
        sync_install = true,
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        additional_vim_regex_highlighting = true,
      }
      vim.api.nvim_set_keymap("n", "ff", ":Telescope fd<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "fr", ":Telescope oldfiles<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "ft", ":Telescope live_grep<CR>", { noremap = true, silent = true })
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup()
      vim.api.nvim_set_keymap("n", "<A-h>", ":ToggleTerm<CR>", { noremap = true, silent = true })
    end,
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {},
  },
}

