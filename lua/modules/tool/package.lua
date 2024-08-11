return {
   -- conform
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    config = require("modules.tool.conform"),
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
  }
}
