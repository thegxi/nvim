return {
  "nvim-treesitter/nvim-treesitter",
  main = "nvim-treesitter.configs",
  branch = "master",
  event = "VeryLazy",
  opts = {
    ensure_installed = { 
      "lua",
      "css",
      "fish",
      "git_config",
      "git_rebase",
      "gitcommit",
      "gitignore",
      "json5",
      "make",
      "scss",
      "sql",
      "cmake",
      "cpp",
      "go",
      "http",
      "java",
      "php",
      "rust",
      "html",
      "javascript",
      "dockerfile",
      "c",
      "bash",
      "python",
      "yaml",
      "typescript",
      "markdown"
    },
    highlight = {
      enable = true,
    },
    match = {
      enable = true,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "zi",
        node_incremental = "zn",
        scope_incremental = "zo",
        node_decremental = "zd",
      },
    },
    indent = {
      enable = true,
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>rp"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>rP"] = "@parameter.inner",
      },
    },
    textsubjects = {
      enable = true,
      keymaps = {
        ["."] = "textsubjects-smart",
        [";"] = "textsubjects-container-outer",
        ["i;"] = "textsubjects-container-inner",
      },
    },
  }
}

