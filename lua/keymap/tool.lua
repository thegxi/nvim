local bind = require("keymap.bind")

local plug_map = {
  -- Plugin: conform.nvim
  ["n|<leader>cF"] = bind.map_callback(function() require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 }) end):with_expr():with_desc("Format Injected Langs")
}

bind.nvim_load_mapping(plug_map)
