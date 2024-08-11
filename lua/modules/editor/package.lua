return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    config = require("modules.editor.neotree"),
    dependencies = { 
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }
}
