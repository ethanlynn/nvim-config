return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      "jose-elias-alvarez/null-ls.nvim",
      "folke/neodev.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("ethanlynn.lsp")
    end,
  },
}
