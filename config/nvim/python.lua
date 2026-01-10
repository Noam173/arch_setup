return {
  -- Python LSP
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {},
      },
    },
  },

  -- Ensure tools are installed via Mason
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "ruff-lsp",
      },
    },
  },
}
