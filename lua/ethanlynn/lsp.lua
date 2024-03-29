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
    "svelte",
    "zls",
  },
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")
lspconfig.clangd.setup({ capabilitites = capabilities })
lspconfig.lua_ls.setup({ capabilities = capabilities })
lspconfig.pyright.setup({ capabilities = capabilities })
lspconfig.rust_analyzer.setup({ capabilities = capabilities })
lspconfig.tsserver.setup({ capabilities = capabilities })
lspconfig.gopls.setup({ capabilities = capabilities })
lspconfig.svelte.setup({ capabilities = capabilities })
lspconfig.zls.setup({ capabilities = capabilities })

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
