return {
  -- Bash LSP
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bashls = {}, -- Bash Language Server
      },
    },
  },

  -- Ensure tools are installed via Mason
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "bash-language-server", -- Bash LSP
        "shellcheck",           -- Linter
        "shfmt",                -- Formatter
      },
    },
  },
}
