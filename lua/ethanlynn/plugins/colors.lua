return {
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.background = "dark"
      vim.cmd([[colorscheme everforest]])
    end,
  },
  "projekt0n/github-nvim-theme",
}
