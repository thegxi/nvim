local bind = require("keymap.bind")

local plug_map = {
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
      end):with_noremap():with_silent():with_desc("lsp: Next Trouble/Quickfix Item"),

  -- Telescope
  ["n|<leader>r"] = bind.map_cr("Telescope oldfiles"):with_noremap():with_silent():with_desc("Telescope: oldfiles"),
  ["n|<leader>D"] = bind.map_cr("Telescope diagnostics"):with_noremap():with_silent():with_desc("Telescope: diagnostics"),
  ["n|<leader>fl"] = bind.map_cr("Telescope live_grep"):with_noremap():with_silent():with_desc("Telescope: live_grep"),
  -- ["n|<leader>fl"] = bind.map_cr("Telescope live_grep"):with_noremap():with_silent():with_desc("Telescope: resume"),
  ["n|<leader>f"] = bind.map_cr("Telescope find_files"):with_noremap():with_silent():with_desc("Telescope: find_files"),
  ["n|<leader>fb"] = bind.map_cr("Telescope buffers"):with_noremap():with_silent():with_desc("Telescope: buffers"), 
  ["n|<leader>fw"] = bind.map_cr("lua require('telescope-live-grep-args.shortcuts').grep_word_under_cursor({postfix=''})"):with_noremap():with_silent():with_desc("Telescope: cursor"), 
  ["v|<leader>fw"] = bind.map_cr("lua require('telescope-live-grep-args.shortcuts').grep_visual_selection({postfix=''})"):with_noremap():with_silent():with_desc("Telescope: cursor"), 
  ["n|<leader>fg"] = bind.map_cr("lua require('telescope').extensions.live_grep_args.live_grep_args()"):with_noremap():with_silent():with_desc("Telescope: args"), 
  -- no ignore, no config
  ["n|<leader>fF"] = bind.map_cr("Telescope find_files find_command=rg,--no-ignore,--hidden,--files,--no-config"):with_noremap():with_silent():with_desc("Telescope: find_files"), 
  ["n|<leader>fW"] = bind.map_cr("lua require('telescope-live-grep-args.shortcuts').grep_word_under_cursor({postfix=' --no-ignore --no-config'})"):with_noremap():with_silent():with_desc("Telescope: cursor"), 
  ["v|<leader>fW"] = bind.map_cr("lua require('telescope-live-grep-args.shortcuts').grep_visual_selection({postfix=' --no-ignore --no-config'})"):with_noremap():with_silent():with_desc("Telescope: cursor"), 
  ["n|<leader>s"] = bind.map_cr("lua require('telescope.builtin').lsp_document_symbols({symbol_width = 55, fname_width = 25})"):with_noremap():with_silent():with_desc("Telescope: builtin"), 
  ["n|<leader>S"] = bind.map_cr("Telescope lsp_dynamic_workspace_symbols"):with_noremap():with_silent():with_desc("Telescope: lsp"), 
  ["n|gr"] = bind.map_cr("Telescope lsp_references"):with_noremap():with_silent():with_desc("Telescope: lsp_references"), 
  ["n|gd"] = bind.map_cr("Telescope lsp_definitions"):with_noremap():with_silent():with_desc("Telescope: lsp_definitions"),
  
  -- dap
  ["n|<leader>dt"] = bind.map_cr("lua require('dapui').toggle()"):with_noremap():with_silent():with_desc("DapUi: toggle"),
  ["n|<leader>dT"] = bind.map_cr("lua require('dapui').float_element('stacks', {})"):with_noremap():with_silent():with_desc("DapUi: stacks"),
  ["n|<leader>db"] = bind.map_cr("lua require'dap'.toggle_breakpoint()"):with_noremap():with_silent():with_desc("Dap: breakpoint"),
  ["n|<leader>dB"] = bind.map_cr("lua require'dap'.toggle_breakpoint(vim.fn.input('Breakpoint condition: '))"):with_noremap():with_silent():with_desc("Dap: breakpoint condition"),
  ["n|<leader>dc"] = bind.map_cr("DapContinue"):with_noremap():with_silent():with_desc("Dap: continue"),
  ["n|<leader>dn"] = bind.map_cr("lua require'dap'.step_over()"):with_noremap():with_silent():with_desc("Dap: step_over"),
  ["n|<leader>ds"] = bind.map_cr("lua require'dap'.step_into()"):with_noremap():with_silent():with_desc("Dap: step_info"),
  ["n|<leader>df"] = bind.map_cr("lua require'dap'.step_out()"):with_noremap():with_silent():with_desc("Dap: step_out"),
  ["n|<leader>dk"] = bind.map_cr("lua require'dap'.terminate()"):with_noremap():with_silent():with_desc("Dap: terminate"),
  ["n|<leader>de"] = bind.map_cr("lua require('dapui').eval()"):with_noremap():with_silent():with_desc("Dap: eval"),
  ["n|<leader>d"] = bind.map_cr("lua require'dap'.run_last()"):with_noremap():with_silent():with_desc("Dap: run_last"),

  -- none-ls
  ["n|<leader>l"] = bind.map_callback(function() require("null-ls").get_server(0).format() end):with_noremap():with_silent():with_desc("Format: format file"),
  ["i|<leader>l"] = bind.map_callback(function() require("null-ls").get_server(0).format() end):with_noremap():with_silent():with_desc("Format: format file"),

  -- toggleterm
  ["t|<Esc><Esc>"] = bind.map_cmd([[<C-\><C-n>]]):with_noremap():with_silent(), -- switch to normal mode in terminal.
	["n|<C-\\>"] = bind.map_cr("ToggleTerm direction=horizontal") :with_noremap() :with_silent() :with_desc("terminal: Toggle horizontal"),
	["i|<C-\\>"] = bind.map_cmd("<Esc><Cmd>ToggleTerm direction=horizontal<CR>") :with_noremap() :with_silent() :with_desc("terminal: Toggle horizontal"),
	["t|<C-\\>"] = bind.map_cmd("<Cmd>ToggleTerm<CR>"):with_noremap():with_silent():with_desc("terminal: Toggle horizontal"),
	["n|<A-\\>"] = bind.map_cr("ToggleTerm direction=vertical") :with_noremap() :with_silent() :with_desc("terminal: Toggle vertical"),
	["i|<A-\\>"] = bind.map_cmd("<Esc><Cmd>ToggleTerm direction=vertical<CR>") :with_noremap() :with_silent() :with_desc("terminal: Toggle vertical"),
	["t|<A-\\>"] = bind.map_cmd("<Cmd>ToggleTerm<CR>"):with_noremap():with_silent():with_desc("terminal: Toggle vertical"),
	["n|<F5>"] = bind.map_cr("ToggleTerm direction=vertical") :with_noremap() :with_silent() :with_desc("terminal: Toggle vertical"),
	["i|<F5>"] = bind.map_cmd("<Esc><Cmd>ToggleTerm direction=vertical<CR>") :with_noremap() :with_silent() :with_desc("terminal: Toggle vertical"),
	["t|<F5>"] = bind.map_cmd("<Cmd>ToggleTerm<CR>"):with_noremap():with_silent():with_desc("terminal: Toggle vertical"),
	["n|<A-d>"] = bind.map_cr("ToggleTerm direction=float"):with_noremap():with_silent():with_desc("terminal: Toggle float"),
	["i|<A-d>"] = bind.map_cmd("<Esc><Cmd>ToggleTerm direction=float<CR>") :with_noremap() :with_silent() :with_desc("terminal: Toggle float"),
	["t|<A-d>"] = bind.map_cmd("<Cmd>ToggleTerm<CR>"):with_noremap():with_silent():with_desc("terminal: Toggle float"),
  ["n|<leader>tg"] = bind.map_cr("lua require('toggleterm.terminal').Terminal:new({cmd = 'lazygit',direction = 'float'}):toggle()"):with_noremap():with_silent():with_desc("Lazygit: terminal lazygit"),
  ["n|<leader>tt"] = bind.map_cr("TermExec cmd='tig %' go_back=1 direction=float"):with_noremap():with_silent():with_desc("Lazygit: terminal lazygit"),
  ["n|<leader>tb"] = bind.map_cr("TermExec cmd='tig blame %' go_back=1 direction=float"):with_noremap():with_silent():with_desc("Lazygit: terminal lazygit"),
  ["t|<c-q>"] = bind.map_cr("bd!"):with_noremap():with_silent():with_desc("Lazygit: terminal lazygit")
}

bind.nvim_load_mapping(plug_map)
