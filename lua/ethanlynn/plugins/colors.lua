return {
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme catppuccin]])
    end,
  },
  "sainnhe/gruvbox-material",
  "projekt0n/github-nvim-theme",
}
