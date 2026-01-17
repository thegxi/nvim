return {
    "mason-org/mason.nvim",
    event = "VeryLazy",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mason-org/mason-lspconfig.nvim"
    },
    opts = {},
    config = function (_, opts)
      require("mason").setup(opts)
      local registry = require "mason-registry"

      local function setup(name, config)
        local success, package = pcall(registry.get_package, name)
        if success and not package:is_installed() then
          package:install()
        end

        local lsp = require("mason-lspconfig").get_mappings().package_to_lspconfig[name]
        config.capabilities = require("blink.cmp").get_lsp_capabilities()

        config.on_attach = function (client)
          -- 禁用lsp提供的格式化代码
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.docuemntRangeFormattingProvider = false
        end

        vim.lsp.config(lsp, config)
      end

      setup("lua-language-server", {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          }
        }
      })
      -- vim.cmd("LspStart")
      vim.diagnostic.config({ update_in_insert = true })
    end,
}


