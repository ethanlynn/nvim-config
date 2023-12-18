return {
  {
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("monokai-pro").setup({})
      vim.cmd([[colorscheme monokai-pro-machine]])
    end,
  },
  "sainnhe/gruvbox-material",
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = { disable_italics = true },
  },
  "projekt0n/github-nvim-theme",
  "catppuccin/nvim",
}
