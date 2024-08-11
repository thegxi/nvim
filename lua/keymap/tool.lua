local bind = require("keymap.bind")

local plug_map = {
  -- Plugin: conform.nvim
  ["n|<leader>cF"] = bind.map_callback(function() require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 }) end):with_expr():with_desc("Format Injected Langs"),
  -- Plugin: trouble.nvim
	["n|<leader>xx"] = bind.map_cr("Trouble diagnostics toggle"):with_noremap():with_silent():with_desc("lsp: Toggle trouble list"),
	["n|<leader>xX"] = bind.map_cr("Trouble diagnostics toggle filter.buf=0"):with_noremap():with_silent():with_desc("lsp: Buffer Diagnostics (Trouble)"),
	["n|<leader>cs"] = bind.map_cr("Trouble symbols toggle"):with_noremap():with_silent():with_desc("lsp: Symbols (Trouble)"),
	["n|<leader>cS"] = bind.map_cr("Trouble lsp toggle"):with_noremap():with_silent():with_desc("lsp: references/definitions/.. (Trouble)"),
	["n|<leader>xL"] = bind.map_cr("Trouble loclist toggle"):with_noremap():with_silent():with_desc("lsp: Location List (Trouble)"),
	["n|<leader>xQ"] = bind.map_cr("Trouble qflist toggle"):with_noremap():with_silent():with_desc("lsp: Quickfix List (Trouble)"),
	["n|[q"] = bind.map_callback(function()
        if require("trouble").is_open() then
          require("trouble").prev({ skip_groups = true, jump = true })
        else
          local ok, err = pcall(vim.cmd.cprev)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end):with_noremap():with_silent():with_desc("lsp: Previous Trouble/Quickfix Item"),
  ["n|]q"] = bind.map_callback(function()
        if require("trouble").is_open() then
          require("trouble").next({ skip_groups = true, jump = true })
        else
          local ok, err = pcall(vim.cmd.cnext)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end):with_noremap():with_silent():with_desc("lsp: Next Trouble/Quickfix Item")
}

bind.nvim_load_mapping(plug_map)
