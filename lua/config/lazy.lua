local global = require("config.global")
local vim_path = global.vim_path
local data_dir = global.data_dir
local lazy_path = data_dir .. "lazy/lazy.nvim"
local modules_dir = vim_path .. "/lua/modules"
local user_config_dir = vim_path .. "/lua/user"
if not (vim.uv or vim.loop).fs_stat(lazy_path) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazy_path })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazy_path)
local lazy_settings = {
  spec = {
    -- 这里写插件列表或模块化导入
    { import = "plugins" }, -- 从 lua/plugins/*.lua 导入
  },
	root = data_dir .. "lazy", -- directory where plugins will be installed
  git = {
    -- log = { "-10" }, -- show the last 10 commits
    timeout = 300,
    url_format = clone_prefix,
  },
  install = {
    -- install missing plugins on startup. This doesn't increase startup time.
    missing = true,
    colorscheme = { "everforest" },
  },
  ui = {
    -- a number <1 is a percentage., >1 is a fixed size
    size = { width = 0.88, height = 0.8 },
    wrap = true, -- wrap the lines in the ui
    -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
    border = "rounded",
    icons = {
      cmd = "",
      config = "",
      event = "",
      ft = "",
      init = "",
      import = "",
      keys = "",
      loaded = "󰄳",
      not_loaded = "󰊠",
      plugin = "",
      runtime = "",
      source = "",
      start = "",
      list = {
        "",
        "",
        "",
        "",
      },
    },
  },
  performance = {
    cache = {
      enabled = true,
      path = vim.fn.stdpath("cache") .. "/lazy/cache",
      -- Once one of the following events triggers, caching will be disabled.
      -- To cache all modules, set this to `{}`, but that is not recommended.
      disable_events = { "UIEnter", "BufReadPre" },
      ttl = 3600 * 24 * 2, -- keep unused modules for up to 2 days
    },
    reset_packpath = true, -- reset the package path to improve startup time
    rtp = {
      reset = true, -- reset the runtime path to $VIMRUNTIME and the config directory
      ---@type string[]
      paths = {}, -- add any custom paths here that you want to include in the rtp
      disabled_plugins = {
        -- Comment out `"editorconfig"` to enable native EditorConfig support
        -- WARN: Sleuth.vim already includes all the features provided by this plugin.
        --       Do NOT enable both at the same time, or you risk breaking the entire detection system.
        "editorconfig",
        -- Do not load spell files
        "spellfile",
        -- Do not use builtin matchit.vim and matchparen.vim because we're using vim-matchup
        "matchit",
        "matchparen",
        -- Do not load tohtml.vim
        "tohtml",
        -- Do not load zipPlugin.vim, gzip.vim and tarPlugin.vim (all of these plugins are
        -- related to reading files inside compressed containers)
        "gzip",
        "tarPlugin",
        "zipPlugin",
        -- Disable remote plugins
        -- NOTE:
        --  > Disabling rplugin.vim will make `wilder.nvim` complain about missing rplugins during :checkhealth,
        --  > but since its config doesn't require python rtp (strictly), it's fine to ignore that for now.
        -- "rplugin",
      },
    },
  },
}

require("lazy").setup(lazy_settings)


