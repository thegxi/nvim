return {
  -- hot key tip
  {
    "folke/which-key.nvim",
	  lazy = true,
	  event = { "CursorHold", "CursorHoldI" },
	  config = require("modules.tool.which-key"),
  },
  -- error ui
  {
    "folke/trouble.nvim",
	  lazy = true,
	  cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
	  config = require("modules.tool.trouble")
  },
  -- formatter
  {
    "nvimtools/none-ls.nvim",
    config = require("modules.tool.none-ls")
  },
  -- finder
  {
    "nvim-telescope/telescope.nvim", tag = '0.1.8',
    dependencies = { 
      { "nvim-lua/plenary.nvim" },
      { 
        "nvim-telescope/telescope-live-grep-args.nvim" ,
        -- This will not install any breaking changes.
        -- For major updates, this must be adjusted manually.
        version = "^1.0.0",
      },
    },
    config = require("modules.tool.telescope")
  }
}
