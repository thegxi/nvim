-- ================================= Snacks.nvim =================================
vim.keymap.set("n", "<leader><space>", function() Snacks.picker.smart() end, { desc = "Smart Find Files" })
vim.keymap.set("n", "<leader>,", function() Snacks.picker.buffers() end, { desc = "Buffers" })
vim.keymap.set("n", "<leader>/", function() Snacks.picker.grep() end, { desc = "Grep" })
vim.keymap.set("n", "<leader>:", function() Snacks.picker.command_history() end, { desc = "Command History" })
vim.keymap.set("n", "<leader>n", function() Snacks.picker.notifications() end, { desc = "Notification History" })
-- vim.keymap.set("n", "<leader>e", function() Snacks.explorer() end, { desc = "File Explorer" })
-- find
vim.keymap.set("n", "<leader>fb", function() Snacks.picker.buffers() end, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, { desc = "Find Config File" })
vim.keymap.set("n", "<leader>ff", function() Snacks.picker.files() end, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", function() Snacks.picker.git_files() end, { desc = "Find Git Files" })
vim.keymap.set("n", "<leader>fp", function() Snacks.picker.projects() end, { desc = "Projects" })
vim.keymap.set("n", "<leader>fr", function() Snacks.picker.recent() end, { desc = "Recent" })
-- git
vim.keymap.set("n", "<leader>gb", function() Snacks.picker.git_branches() end, { desc = "Git Branches" })
vim.keymap.set("n", "<leader>gl", function() Snacks.picker.git_log() end, { desc = "Git Log" })
vim.keymap.set("n", "<leader>gL", function() Snacks.picker.git_log_line() end, { desc = "Git Log Line" })
vim.keymap.set("n", "<leader>gs", function() Snacks.picker.git_status() end, { desc = "Git Status" })
vim.keymap.set("n", "<leader>gS", function() Snacks.picker.git_stash() end, { desc = "Git Stash" })
vim.keymap.set("n", "<leader>gd", function() Snacks.picker.git_diff() end, { desc = "Git Diff (Hunks)" })
vim.keymap.set("n", "<leader>gf", function() Snacks.picker.git_log_file() end, { desc = "Git Log File" })
-- Grep
vim.keymap.set("n", "<leader>sb", function() Snacks.picker.lines() end, { desc = "Buffer Lines" })
vim.keymap.set("n", "<leader>sB", function() Snacks.picker.grep_buffers() end, { desc = "Grep Open Buffers" })
vim.keymap.set("n", "<leader>sg", function() Snacks.picker.grep() end, { desc = "Grep" })
vim.keymap.set({ "n", "x" }, "<leader>sw", function() Snacks.picker.grep_word() end, { desc = "Visual selection or word" })
-- search
vim.keymap.set("n", '<leader>s"', function() Snacks.picker.registers() end, { desc = "Registers" })
vim.keymap.set("n", '<leader>s/', function() Snacks.picker.search_history() end, { desc = "Search History" })
vim.keymap.set("n", "<leader>sa", function() Snacks.picker.autocmds() end, { desc = "Autocmds" })
vim.keymap.set("n", "<leader>sb", function() Snacks.picker.lines() end, { desc = "Buffer Lines" })
vim.keymap.set("n", "<leader>sc", function() Snacks.picker.command_history() end, { desc = "Command History" })
vim.keymap.set("n", "<leader>sC", function() Snacks.picker.commands() end, { desc = "Commands" })
vim.keymap.set("n", "<leader>sd", function() Snacks.picker.diagnostics() end, { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, { desc = "Buffer Diagnostics" })
vim.keymap.set("n", "<leader>sh", function() Snacks.picker.help() end, { desc = "Help Pages" })
vim.keymap.set("n", "<leader>sH", function() Snacks.picker.highlights() end, { desc = "Highlights" })
vim.keymap.set("n", "<leader>si", function() Snacks.picker.icons() end, { desc = "Icons" })
vim.keymap.set("n", "<leader>sj", function() Snacks.picker.jumps() end, { desc = "Jumps" })
vim.keymap.set("n", "<leader>sk", function() Snacks.picker.keymaps() end, { desc = "Keymaps" })
vim.keymap.set("n", "<leader>sl", function() Snacks.picker.loclist() end, { desc = "Location List" })
vim.keymap.set("n", "<leader>sm", function() Snacks.picker.marks() end, { desc = "Marks" })
vim.keymap.set("n", "<leader>sM", function() Snacks.picker.man() end, { desc = "Man Pages" })
vim.keymap.set("n", "<leader>sp", function() Snacks.picker.lazy() end, { desc = "Search for Plugin Spec" })
vim.keymap.set("n", "<leader>sq", function() Snacks.picker.qflist() end, { desc = "Quickfix List" })
vim.keymap.set("n", "<leader>sR", function() Snacks.picker.resume() end, { desc = "Resume" })
vim.keymap.set("n", "<leader>su", function() Snacks.picker.undo() end, { desc = "Undo History" })
vim.keymap.set("n", "<leader>uC", function() Snacks.picker.colorschemes() end, { desc = "Colorschemes" })
-- LSP
vim.keymap.set("n", "gd", function() Snacks.picker.lsp_definitions() end, { desc = "Goto Definition" })
vim.keymap.set("n", "gD", function() Snacks.picker.lsp_declarations() end, { desc = "Goto Declaration" })
vim.keymap.set("n", "gr", function() Snacks.picker.lsp_references() end, { nowait = true, desc = "References" })
vim.keymap.set("n", "gI", function() Snacks.picker.lsp_implementations() end, { desc = "Goto Implementation" })
vim.keymap.set("n", "gy", function() Snacks.picker.lsp_type_definitions() end, { desc = "Goto T[y]pe Definition" })
vim.keymap.set("n", "<leader>ss", function() Snacks.picker.lsp_symbols() end, { desc = "LSP Symbols" })
vim.keymap.set("n", "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, { desc = "LSP Workspace Symbols" })
-- Other
vim.keymap.set("n", "<leader>z",  function() Snacks.zen() end, { desc = "Toggle Zen Mode" })
vim.keymap.set("n", "<leader>Z",  function() Snacks.zen.zoom() end, { desc = "Toggle Zoom" })
vim.keymap.set("n", "<leader>.",  function() Snacks.scratch() end, { desc = "Toggle Scratch Buffer" })
vim.keymap.set("n", "<leader>S",  function() Snacks.scratch.select() end, { desc = "Select Scratch Buffer" })
vim.keymap.set("n", "<leader>n",  function() Snacks.notifier.show_history() end, { desc = "Notification History" })
vim.keymap.set("n", "<leader>bd", function() Snacks.bufdelete() end, { desc = "Delete Buffer" })
vim.keymap.set("n", "<leader>cR", function() Snacks.rename.rename_file() end, { desc = "Rename File" })
vim.keymap.set({ "n", "x"}, "<leader>gB", function() Snacks.gitbrowse() end, { desc = "Git Browse" })
vim.keymap.set("n", "<leader>gg", function() Snacks.lazygit() end, { desc = "Lazygit" })
vim.keymap.set("n", "<leader>un", function() Snacks.notifier.hide() end, { desc = "Dismiss All Notifications" })
vim.keymap.set("n", [[<c-\>]],      function() Snacks.terminal() end, { desc = "Toggle Terminal" })
vim.keymap.set("n", "<c-_>",      function() Snacks.terminal() end, { desc = "which_key_ignore" })
vim.keymap.set({ "n", "t" }, "]]",       function() Snacks.words.jump(vim.v.count1) end, { desc = "Next Reference" })
vim.keymap.set({ "n", "t" }, "[[",       function() Snacks.words.jump(-vim.v.count1) end, { desc = "Prev Reference" })
vim.keymap.set("n", "<leader>N",
  function()
    Snacks.win({
      file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
      width = 0.6,
      height = 0.6,
      wo = {
        spell = false,
        wrap = false,
        signcolumn = "yes",
        statuscolumn = " ",
        conceallevel = 3,
      },
    })
  end,
  { desc = "Neovim News" })

-- ================================= Focus =================================
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move focus on left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move focus on right window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move focus on below window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move focus on up window" })
-- ================================= Multi Cursor =================================
vim.keymap.set("x", "mI", function() require("multicursor-nvim").insertVisual() end, { desc = "Insert cursors at visual selection" })
vim.keymap.set("x", "mA", function() require("multicursor-nvim").appendVisual() end, { desc = "Append cursors at visual selection" })
-- ================================= Comment =================================
vim.keymap.set("n", "<leader>/", function() require("Comment.api").toggle.linewise.current() end, { desc = "[Comment] Comment current line" })
vim.keymap.set("v", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", { desc = "Comment current line" })
vim.keymap.set("n", "<C-_>", function() require("Comment.api").toggle.linewise.current() end, { desc = "[Comment] Comment current line" })
vim.keymap.set("v", "<C-_>", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", { desc = "Comment current line" })
-- ================================= Todo Comment =================================
vim.keymap.set("n", "<leader>st", function() require("snacks").picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME", "BUG", "FIXIT", "HACK", "WARN", "ISSUE"  } }) end, { desc = "[TODO] Pick todos (without NOTE)" })
vim.keymap.set("n", "<leader>sT", function() require("snacks").picker.todo_comments() end, { desc = "[TODO] Pick todos (without NOTE)" })
-- ================================= Flash =================================
vim.keymap.set({ "n", "x", "o" }, "<leader>f", function() require("flash").jump() end, { desc = "[Flash] Jump" })
vim.keymap.set({ "n", "x", "o" }, "<leader>F", function() require("flash").treesitter() end, { desc = "[Flash] Treesitter" })
vim.keymap.set({ "x", "o" }, "<leader>F", function() require("flash").treesitter_search() end, { desc = "[Flash] Treesitter Search" })
vim.keymap.set("c", "<c-f>", function() require("flash").toggle() end, { desc = "[Flash] Toggle Search" })
vim.keymap.set({ "n", "x", "o" }, "<leader>j", function() require("flash").jump({
            search = { mode = "search", max_length = 0 },
            jump = { pos = "end" },
            label = { after = { 0, 0 }, matches = false },
            pattern = "^\\s*\\S\\?", -- match non-whitespace at start plus any character (ignores empty lines)
          })
 end, { desc = "[Flash] Line jump" })
vim.keymap.set({ "n", "x", "o" }, "<leader>k", function() require("flash").jump({
            search = { mode = "search", max_length = 0 },
            jump = { pos = "end" },
            label = { after = { 0, 0 }, matches = false },
            pattern = "^\\s*\\S\\?", -- match non-whitespace at start plus any character (ignores empty lines)
          })
 end, { desc = "[Flash] Line jump" })
-- ================================= Buffer =================================
vim.keymap.set("n", "<A-<>", "<CMD>BufferMovePrevious<CR>", { desc = "[Buffer] Move buffer left" })
vim.keymap.set("n", "<A->>", "<CMD>BufferMoveNext<CR>", { desc = "[Buffer] Move buffer right" })
vim.keymap.set("n", "<A-1>", "<CMD>BufferGoto 1<CR>", { desc = "[Buffer] Go to buffer 1" })
vim.keymap.set("n", "<A-2>", "<CMD>BufferGoto 2<CR>", { desc = "[Buffer] Go to buffer 1" })
vim.keymap.set("n", "<A-3>", "<CMD>BufferGoto 3<CR>", { desc = "[Buffer] Go to buffer 1" })
vim.keymap.set("n", "<A-4>", "<CMD>BufferGoto 4<CR>", { desc = "[Buffer] Go to buffer 1" })
vim.keymap.set("n", "<A-5>", "<CMD>BufferGoto 5<CR>", { desc = "[Buffer] Go to buffer 1" })
vim.keymap.set("n", "<A-6>", "<CMD>BufferGoto 6<CR>", { desc = "[Buffer] Go to buffer 1" })
vim.keymap.set("n", "<A-7>", "<CMD>BufferGoto 7<CR>", { desc = "[Buffer] Go to buffer 1" })
vim.keymap.set("n", "<A-8>", "<CMD>BufferGoto 8<CR>", { desc = "[Buffer] Go to buffer 1" })
vim.keymap.set("n", "<A-9>", "<CMD>BufferGoto 9<CR>", { desc = "[Buffer] Go to buffer 1" })
vim.keymap.set("n", "<A-h>", "<CMD>BufferPrevious<CR>", { desc = "[Buffer] Previous buffer" })
vim.keymap.set("n", "<A-l>", "<CMD>BufferNext<CR>", { desc = "[Buffer] Next buffer" })
vim.keymap.set("n", "<A-w>", "<CMD>BufferClose<CR>",  { desc = "Close buffer" })
-- ================================= Yazi =================================
vim.keymap.set({ "n", "v" }, "<leader>E", "<CMD>Yazi<CR>",  { desc = "[Yazi] open at the current file" })
vim.keymap.set("n", "<leader>cw", "<CMD>Yazi cwd<CR>",  { desc = "[Yazi] open in working directory" })
vim.keymap.set("n", "<c-up>", "<CMD>Yazi toggle<CR>",  { desc = "[Yazi] Resume the last session" })
