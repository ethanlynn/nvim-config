return {
  {
    "mcchrish/zenbones.nvim",
    dependencies = { "rktjmp/lush.nvim" },
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.background = "light"
      vim.cmd([[colorscheme zenbones]])
    end,
  },
}
