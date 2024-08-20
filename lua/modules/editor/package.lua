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
  },
  -- markdown
  {
    "MeanderingProgrammer/render-markdown.nvim",
    lazy = true,
    ft = "markdown",
    config = require("modules.editor.render-markdown"),
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-treesitter/nvim-treesitter"
    }
  },
  {
    "iamcco/markdown-preview.nvim",
    lazy = true,
    ft = "markdown",
    build = ":call mkdp#util#install()",
  },
  {
    "m4xshen/autoclose.nvim",
    lazy = true,
    event = "InsertEnter",
    config = require("modules.editor.autoclose"),
  }
}
