
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
  {"catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    -- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' }
  }
}
local opt = {}
require("lazy").setup(plugins, opts)

local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = {"lua", "javascript", "cpp"},
  highlight = {enable = true},
  indent = {enable = true}
})

require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

