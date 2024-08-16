return {
   -- conform
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    config = require("modules.tool.conform"),
    keys = {
      {
        "<leader>cF",
        function()
          require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
        end,
        mode = { "n", "v" },
        desc = "Format Injected Langs",
      },
    },
    init = function()
      -- If you want the formatexpr, here is the place to set it
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end
  },
  -- which-key.nvim
  {
    "folke/which-key.nvim",
	  lazy = true,
	  event = { "CursorHold", "CursorHoldI" },
	  config = require("modules.tool.which-key"),
  },
  -- trouble.nvim
  {
    "folke/trouble.nvim",
	  lazy = true,
	  cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
	  config = require("modules.tool.trouble")
  }
}
