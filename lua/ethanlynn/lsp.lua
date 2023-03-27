require("neodev").setup()
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "clangd",
    "lua_ls",
    "rust_analyzer",
    "tsserver",
  },
})

local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({})
lspconfig.rust_analyzer.setup({})
lspconfig.tsserver.setup({})

local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.rustfmt,
    null_ls.builtins.formatting.stylua,
  },
})

-- Enable format on save via LSP.
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = {
    "*.css",
    "*.html",
    "*.js",
    "*.jsx",
    "*.lua",
    "*.rs",
    "*.scss",
    "*.ts",
    "*.tsx",
  },
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
