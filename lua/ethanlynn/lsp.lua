require("neodev").setup()
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "clangd",
    "lua_ls",
    "pyright",
    "rust_analyzer",
    "tsserver",
    "gopls",
  },
})

local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({})
lspconfig.pyright.setup({})
lspconfig.rust_analyzer.setup({})
lspconfig.tsserver.setup({})
lspconfig.gopls.setup({})

local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    -- Diagnostics
    null_ls.builtins.diagnostics.eslint.with({
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "svelte",
    }),
    -- Formatting
    null_ls.builtins.formatting.prettier.with({
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "css",
        "scss",
        "html",
        "json",
        "jsonc",
        "yaml",
        "markdown",
        "markdown.mdx",
        "graphql",
        "svelte",
      },
    }),
    null_ls.builtins.formatting.rustfmt,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.black,
  },
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = {
    "*.css",
    "*.html",
    "*.md",
    "*.mdx",
    "*.js",
    "*.jsx",
    "*.ts",
    "*.tsx",
    "*.cjs",
    "*.json",
    "*.lua",
    "*.rs",
    "*.py",
    "*.svelte",
  },
  callback = function()
    vim.lsp.buf.format({
      async = false,
      filter = function(client)
        return client.name == "null-ls"
      end,
    })
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = {
    "*.go",
  },
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
