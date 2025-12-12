return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
	"lua-language-server"
      },
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    },
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      
    end
  }
}
