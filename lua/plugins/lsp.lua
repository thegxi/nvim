return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig",
    },
    config = require("plugins.lsp.lspconfig")
  },
}
