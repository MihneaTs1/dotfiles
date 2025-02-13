-- Plugins

vim.cmd([[
call plug#begin()
  
Plug 'm4xshen/autoclose.nvim'
Plug 'folke/tokyonight.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'xeluxee/competitest.nvim'
Plug 'nvim-treesitter/nvim-treesitter'

call plug#end()
PlugInstall
q
]])

-- Options

require("autoclose").setup()
require("competitest").setup {
        received_problems_path = "$(HOME)/Documents/Programming/Competitive/$(JUDGE)/$(CONTEST)/$(PROBLEM).$(FEXT)",
	received_contests_directory = "$(HOME)/Documents/Programming/Competitive/$(JUDGE)/$(CONTEST)",
 	received_contests_problems_path = "$(PROBLEM)/main.$(FEXT)",
        compile_command = {
                cpp = { exec = "g++", args = { "-std=gnu++23", "-Wall", "-DLOCAL", "$(FNAME)", "-o", "$(FNOEXT)" } },
        },

        testcases_directory = "./.competitest",
        template_file = "$(HOME)/Documents/Programming/Competitive/Template/template.cpp",
        evaluate_template_modifiers = true,
}
require("nvim-treesitter.configs").setup {
        highlight = {
                enable = true,
        },
}

vim.o.tabstop=4
vim.o.shiftwidth=4
vim.o.number=true
vim.cmd([[
colorscheme tokyonight-night
set clipboard=unnamedplus
set mouse=
]])
