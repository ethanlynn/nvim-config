return {
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
      },
      sync_install = false,
      auto_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    })
  end,
}
