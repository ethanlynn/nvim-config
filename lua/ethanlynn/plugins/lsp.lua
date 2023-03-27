return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("ethanlynn.lsp")
    end,
  },
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  "jose-elias-alvarez/null-ls.nvim",
}
