return {
  {
    "rose-pine/neovim",
    name = 'rose-pine',
    lazy = false,
    priority = 100,
    config = function()
      require("rose-pine").setup({
        disable_italics = true
      })
      vim.cmd([[colorscheme rose-pine]])
    end
  },
  "nordtheme/vim"
}
