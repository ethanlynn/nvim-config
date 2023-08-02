return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash",
          "c",
          "cmake",
          "cpp",
          "css",
          "dockerfile",
          "javascript",
          "json",
          "lua",
          "markdown",
          "python",
          "rust",
          "scss",
          "sql",
          "terraform",
          "toml",
          "tsx",
          "typescript",
          "vim",
          "svelte",
          "go",
        },
        sync_install = false,
        auto_install = false,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["ia"] = "@assignment.inner",
              ["aa"] = "@assignment.outer",
              ["al"] = "@assignment.lhs",
              ["ar"] = "@assignment.rhs",
              ["iB"] = "@block.inner",
              ["aB"] = "@block.outer",
              ["if"] = "@function.inner",
              ["af"] = "@function.outer",
              ["iP"] = "@parameter.inner",
              ["aP"] = "@parameter.outer",
            },
          },
        },
      })
    end,
  },
  "nvim-treesitter/nvim-treesitter-textobjects",
}
