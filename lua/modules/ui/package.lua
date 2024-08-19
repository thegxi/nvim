return {
  -- tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = false,
    opts = { style = "moon" },
  },
  -- gruvbox-baby
  {
		"luisiacc/gruvbox-baby",
		lazy = false,
	},
  -- catppuccin
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    opts = {
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        grug_far = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
  },
  -- lualine
  {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	init = function()
		vim.g.lualine_laststatus = vim.o.laststatus
		if vim.fn.argc(-1) > 0 then
			-- set an empty statusline till lualine loads
			vim.o.statusline = " "
		else
			-- hide the statusline on the starter page
			vim.o.laststatus = 0
		end
	end,
	opts = require("modules.ui.lualine")
  },
  -- buffer
  {
    "nvimdev/flybuf.nvim",
    cmd = "FlyBuf",
    config = require("modules.ui.flybuf")
  },
	-- indent-blankline
	{
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = require("modules.ui.indent-blankline")
	},
	-- gitsigns
	{
	  "lewis6991/gitsigns.nvim",
	  lazy = true,
	  event = { "CursorHold", "CursorHoldI" },
	  config = require("modules.ui.gitsigns")
	},
	-- notify
	{
    "rcarriga/nvim-notify",
    lazy = true,
	  event = "VeryLazy",
	  config = require("modules.ui.notify")
  },
  -- dashboard-nvim
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = require("modules.ui.dashboard"),
    dependencies = { "nvim-tree/nvim-web-devicons"}
  },
  -- nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- last release is way too old and doesn't work on Windows
    build = ":TSUpdate",
    event = { "VeryLazy" },
    lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
    init = function(plugin)
      -- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
      -- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
      -- no longer trigger the **nvim-treesitter** module to be loaded in time.
      -- Luckily, the only things that those plugins need are the custom queries, which we make available
      -- during startup.
      require("lazy.core.loader").add_to_rtp(plugin)
      require("nvim-treesitter.query_predicates")
    end,
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    opts_extend = { "ensure_installed" },
    ---@type TSConfig
    ---@diagnostic disable-next-line: missing-fields
    config = require("modules.ui.treesitter")
  }
}
