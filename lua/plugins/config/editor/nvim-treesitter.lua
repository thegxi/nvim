return function()
  vim.opt.foldmethod = "expr"
  vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

  -- Unfold all upon opening a file, see:
  -- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
  vim.opt.foldlevel = 99

  require('nvim-treesitter').setup({
    ensure_installed = {
      "c",
      "c_sharp",
      "cpp",
      "css",
      "fortran",
      "html",
      "javascript",
      "json",
      "lua",
      "python",
      "rust",
      "typescript",
      "tsx",
      "vim",
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<CR>",
        node_incremental = "<CR>",
        node_decremental = "<BS>",
        scope_incremental = "<TAB>",
      },
    },
    indent = {
      enable = true,
      -- conflicts with flutter-tools.nvim, causing performance issues
      disable = { "dart" },
    }
  })
end
