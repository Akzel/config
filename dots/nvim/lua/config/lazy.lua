-- Bootstrap lazy.nvim
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
vim.g.maplocalleader = " "

-- Setup lazy.nvim
require("lazy").setup({
  { 'rebelot/kanagawa.nvim', priority = 1000,
    init = function()
      vim.cmd.colorscheme 'kanagawa'
    end,
  },

  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  install = { colorscheme = { "kanagawa" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

--
-- require('lazy').setup({
--   {'tpope/vim-sleuth' }, 
--   { 'lewis6991/gitsigns.nvim' },
--   { 'folke/which-key.nvim', },
--   {
--     'folke/todo-comments.nvim', event = 'VimEnter',
--     dependencies = {
--       'nvim-lua/plenary.nvim' 
--     }, opts = { signs = false }
--   },
--
--   { 
--     'echasnovski/mini.nvim',
--     config = function()
--       require('mini.ai').setup { n_lines = 500 }
--       require('mini.surround').setup()
--       local statusline = require 'mini.statusline'
--       statusline.setup { use_icons = true }
--     end,
--   },
--   { -- Highlight, edit, and navigate code
--     'nvim-treesitter/nvim-treesitter',
--     build = ':TSUpdate',
--     main = 'nvim-treesitter.configs', -- Sets main module to use for opts
--     opts = {
--       auto_install = true,
--       highlight = {
--         enable = true,
--         additional_vim_regex_highlighting = { 'ruby' },
--       },
--       indent = { enable = true, disable = { 'ruby' } },
--     },
--   }, 
-- })

