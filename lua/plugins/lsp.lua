return {
  {
    -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
      -- { "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
      "williamboman/mason-lspconfig.nvim",
      -- "hrsh7th/cmp-nvim-lsp",
      -- "SmiteshP/nvim-navic",
      -- Show lsp status on the bottom-left
      -- Have no idea why it still works when not installed
      -- "j-hui/fidget.nvim",
      "saghen/blink.cmp",
    },
    opts = {},
    config = function(_, _)
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "rust_analyzer", "marksman", "jsonls", "pyright" },
        automatic_enable = false,
      })

      local extra = {
        capabilities = require("blink.cmp").get_lsp_capabilities(),
      }
      -- require("snacks.debug").inspect(extra.capabilities)

      require("lspconfig").jsonls.setup({})

      -- require("lspconfig").ltex.setup({})
      require("lspconfig").clangd.setup({
        cmd = {
          "clangd",
          -- "--header-insertion=never",
        },
      })

      vim.lsp.config("*", {
        capabilities = require("blink.cmp").get_lsp_capabilities(),
      })

      vim.lsp.config("typos_lsp", {
        init_options = {
          -- Custom config. Used together with a config file found in the workspace or its parents,
          -- taking precedence for settings declared in both.
          -- Equivalent to the typos `--config` cli argument.
          -- config = "~/code/typos-lsp/crates/typos-lsp/tests/typos.toml",
          -- How typos are rendered in the editor, can be one of an Error, Warning, Info or Hint.
          -- Defaults to error.
          diagnosticSeverity = "Hint",
        },
      })
      vim.lsp.enable("typos_lsp")

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          -- local opts_local = { buffer = ev.buf }
          -- vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
          -- vim.keymap.set("n", "gd", vim.lsp.buf.definition)
          -- vim.keymap.set("n", "K", vim.lsp.buf.hover) -- defined in nvim-ufo
          -- vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
          vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, {
            buffer = ev.buf,
            desc = "[LSP] Show diagnostic",
          })
          vim.keymap.set("n", "<leader>gk", vim.lsp.buf.signature_help, { desc = "[LSP] Signature help" })
          vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "[LSP] Add workspace folder" })
          vim.keymap.set(
            "n",
            "<leader>wr",
            vim.lsp.buf.remove_workspace_folder,
            { desc = "[LSP] Remove workspace folder" }
          )
          vim.keymap.set("n", "<leader>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, { desc = "[LSP] List workspace folders" })
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = ev.buf, desc = "[LSP] Rename" })
          -- vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts_local)
          -- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts_local)
        end,
      })
    end,
  },
  --------------------------------- Language servler install ----------------------------------
  {
    "mason-org/mason.nvim",
    event = "VeryLazy",
    -- keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    opts_extend = { "ensure_installed" },
    opts = {
      ensure_installed = {},
    },
    ---@param opts MasonSettings | {ensure_installed: string[]}
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")

      local function ensure_installed()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end
      if mr.refresh then
        mr.refresh(ensure_installed)
      else
        ensure_installed()
      end
    end,
  },
}
