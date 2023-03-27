-- Disable netrw.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Leader must be set before loading plugins.
vim.g.mapleader = " "

-- Bootstrap lazy.nvim.
local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazy_path) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazy_path,
  })
end
vim.opt.rtp:prepend(lazy_path)

require("lazy").setup("ethanlynn.plugins")
require("ethanlynn.opts")
require("ethanlynn.keymap")
