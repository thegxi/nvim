local map = vim.keymap.set

-- basic
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = "Save file"})
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = "Save file"})

map({ "i", "n", "v", "s" }, "<c-s>", "<cmd>w<cr>", { noremap = true, silent = true, desc = "Save file"})
map({ "i", "n" }, "<c-a>", "<cmd>normal! ggVG<cr>", { noremap = true, silent = true, desc = "Select all"})
map("n", "<leader>qq", "<cmd>wqa<cr>", { noremap = true, silent = true, desc = "Exit editor"})

map("n", "<c-up>", "<cmd>resize +2<cr>", { noremap = true, silent = true, desc = "Add window height"})
map("n", "<c-down>", "<cmd>resize -2<cr>", { noremap = true, silent = true, desc = "Reduce window height"})
map("n", "<c-left>", "<cmd>vertical -2<cr>", { noremap = true, silent = true, desc = "Add window width"})
map("n", "<c-right>", "<cmd>resize +2<cr>", { noremap = true, silent = true, desc = "Reduce window width"})

map("n", "<leader>wh", "<c-w>h", { noremap = true, silent = true, desc = "Move window to left"})
map("n", "<leader>wj", "<c-w>j", { noremap = true, silent = true, desc = "Move window to bottom"})
map("n", "<leader>wk", "<c-w>k", { noremap = true, silent = true, desc = "Move window to above"})
map("n", "<leader>wl", "<c-w>l", { noremap = true, silent = true, desc = "Move window to right"})

map("n", "<a-j>", "<cmd>m .+1<cr>==", { noremap = true, silent = true, desc = "Move line down"})
map("n", "<a-k>", "<cmd>m .-2<cr>==", { noremap = true, silent = true, desc = "Move line up"})
map("v", "<a-j>", ":m '>+1<cr>gv=gv", { noremap = true, silent = true, desc = "Move selection down"})
map("v", "<a-k>", ":m '<-2<cr>gv=gv", { noremap = true, silent = true, desc = "Move selection up"})

map("i", "<a-s>", "<c-o>:wq!<CR>", { noremap = true, silent = true, desc = "Force quit file"})
map("i", "jk", "<esc>", { noremap = true, silent = true, desc = "Normal mode"})
map("n", "<leader>p", '"_diwP', { noremap = true, silent = true, desc = "Delete current textobject patest content on there"}) vim.keymap.set("v", "<leader>y", '"+y', { noremap = true, silent = true, desc = "Copy content to system clipboard"})
map("v", "<leader>p", '"_dP', { noremap = true, silent = true, desc = "Delete selected text, patest content on there"})
map("v", "<leader>P", '"_d"+P', { noremap = true, silent = true, desc = "Delete selected text, patest content on there"})

-- bufferLine
map("n", "<leader>bk", "<cmd>BufferLineCyclePrev<cr>", { noremap = true, silent = true, desc = "Prev buffer" })
map("n", "<leader>bj", "<cmd>BufferLineCycleNext<cr>", { noremap = true, silent = true, desc = "Next buffer" })
map("n", "<leader>bd", "<cmd>bdelete<cr>", { noremap = true, silent = true, desc = "Delete buffer" })
map("n", "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", { noremap = true, silent = true, desc = "Delete buffer" })
map("n", "<leader>bp", "<cmd>BufferLinePick<cr>", { noremap = true, silent = true, desc = "Delete buffer" })
map("n", "<leader>bc", "<cmd>BufferLinePickClose<cr>", { noremap = true, silent = true, desc = "Delete buffer" })

-- telescop 
map("n", "<leader>fP", 
  function()
    local builtin = require('telescope.builtin')
    builtin.find_files({
      cwd = require("lazy.core.config").options.root
    })
  end, { desc = "Telescope find plugin file" })
map("n", ";f", 
  function()
    local builtin = require('telescope.builtin')
    builtin.find_files({
      no_ignore = false,
      hidden = true
    })
  end, { desc = "Telescope list files in your current working direcotry, respect .gitignore" })
map("n", ";r", 
  function()
    local builtin = require('telescope.builtin')
    builtin.live_grep({
      additional_args  = { "--hidden" }
    })
  end, { desc = "Search for a string in your current working directory and get results live as you type, respects .gitignore" })
map("n", "\\\\", 
  function()
    local builtin = require('telescope.builtin')
    builtin.buffers()
  end, { desc = "Lists open buffers" })
map("n", ";t", 
  function()
    local builtin = require('telescope.builtin')
    builtin.help_tags()
  end, { desc = "Lists availabel help tags and opens a new window with the relevant help info on <cr>" })
map("n", ";;", 
  function()
    local builtin = require('telescope.builtin')
    builtin.resume()
  end, { desc = "Resume the previous telescope picker" })
map("n", ";e", 
  function()
    local builtin = require('telescope.builtin')
    builtin.diagnostics()
  end, { desc = "Lists Diagnostics for all open buffers or a specific buffer" })
map("n", ";s", 
  function()
    local builtin = require('telescope.builtin')
    builtin.treesitter()
  end, { desc = "Lists function names, variables, from Tresitter" })
map("n", ";c", 
  function()
    local builtin = require('telescope.builtin')
    builtin.lsp_incoming_calls()
  end, { desc = "Lists lsp incoming calls for word under the cursor" })

-- which-key
map("n", "<leader>?",
    function()
      require("which-key").show({ global = false })
    end,
    { desc = "Buffer Local Keymaps (which-key)" })

-- terminal
map("n", "<leader>tt", ":split | terminal<cr>i", { noremap = true, silent = true, desc = "Open terminal" })
map("n", "<leader>tv", ":vsplit | terminal<cr>i", { noremap = true, silent = true, desc = "Open terminal" })
map("t", "<leader>ts", "<c-\\><c-n>", { noremap = true, silent = true, desc = "Exit terminal" })
map("t", "<leader>ss", "<c-\\><c-n><c-w>k", { noremap = true, silent = true, desc = "Exit terminal" })

-- markdown
map("i", "<c-m>p",
  function()
    require("render-markdown").preview()
  end,
  { desc = "Show rendered buffer to the side"})
map("n", "<leader>mp",
  function()
    require("render-markdown").preview()
  end,
  { desc = "Show rendered buffer to the side"})

map("n", "<leader>oi", function()
  vim.lsp.buf.code_action({
    context = { only = { "source.organizeImports" } },
    apply = true
  })
end, { desc = "Organize Imports" })

-- Add missing import
map("n", "<leader>ai", function()
  vim.lsp.buf.code_action({
    context = { 
      only = { "source.addMissingImports" },
      diagnostics = vim.lsp.diagnostic.get_line_diagnostics()
    },
    apply = true
  })
end, { desc = "Add Missing Imports" })

-- File tree
map("n", "<leader>-", ":NvimTreeToggle<cr>", { silent = true, desc = "Open File tree" })
