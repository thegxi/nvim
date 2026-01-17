return {
  "saghen/blink.cmp",
  version = "*",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  event = "VeryLazy",
  opts = {
    completion = { 
      documentation = { auto_show = true, },
    },
    keymap = {
      preset = "super-tab",
    },
    sources = {
      default = { "path", "snippets", "buffer", "lsp" },
    },
    cmdline = {
      sources = function()
        if cmd_type == "/" or cmd_type == "?" then
          return { "buffer" }
        end
        if cmd_type == ":" then
          return { "cmdline" }
        end
        return {}
      end,
      keymap = {
        preset = "super-tab",
      },
      completion = {
        menu = {
          auto_show = true,
        },
      },
    },
  }
}

