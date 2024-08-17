return {
  -- neo-tree.nvim
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    config = require("modules.editor.neotree"),
    dependencies = { 
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  },
  -- grug-far.nvim
  {
    'MagicDuck/grug-far.nvim',
    config = require("modules.editor.grug-far")
  },
  -- flash.nvim
  {
  "folke/flash.nvim",
  event = { "CursorHold", "CursorHoldI" },
  ---@type Flash.Config
  config = require("modules.editor.flash"),
  },
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    opts = {}
  },
  {
    'numToStr/Comment.nvim',
    config = true
  }
}
