return {
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
  },
  {
    "nvimtools/none-ls.nvim",
    config = require("modules.tool.none-ls")
  }
}
