require("neodev").setup()
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "clangd",
    "lua_ls",
    "pyright",
    "rust_analyzer",
    "tsserver",
  },
})

local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({})
lspconfig.pyright.setup({})
lspconfig.rust_analyzer.setup({})
lspconfig.tsserver.setup({})

local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.rustfmt,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.black,
  },
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = {
    "*.css",
    "*.html",
    "*.js",
    "*.jsx",
    "*.ts",
    "*.tsx",
    "*.lua",
    "*.rs",
    "*.py",
  },
  callback = function()
    vim.lsp.buf.format({
      async = true,
      filter = function(client)
        return client.name == "null-ls"
      end,
    })
  end,
})
