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

  --lsp
  {'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'},
  {'williamboman/mason.nvim'},
  {'williamboman/mason-lspconfig.nvim'},
  {'neovim/nvim-lspconfig'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/nvim-cmp'},


      -- import your plugins
    { import = "plugins" },
  install = { colorscheme = { "kanagawa" } },
  -- automatically check for plugin updates
  checker = { enabled = true },

})

local lsp_zero = require('lsp-zero')

local lsp_attach = function(client, bufnr)
  local opts = {buffer = bufnr}

  vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
  vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
  vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
  vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
end

lsp_zero.extend_lspconfig({
  sign_text = true,
  lsp_attach = lsp_attach,
  capabilities = require('cmp_nvim_lsp').default_capabilities()
})

require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {
    function(server_name)
	if server_name == "tsserver" then server_name = "ts_ls" end
      require('lspconfig')[server_name].setup({})
    end,
  }
})

local cmp = require('cmp')

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
  },
  snippet = {
    expand = function(args)
      -- You need Neovim v0.10 to use vim.snippet
      vim.snippet.expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({}),
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

