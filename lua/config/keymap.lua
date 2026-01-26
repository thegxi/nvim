-- basic
vim.keymap.set("i", "<c-s>", "<c-o>:w<CR>", { noremap = true, silent = true, desc = "Save file"})
vim.keymap.set("i", "<c-q>", "<c-o>:q<CR>", { noremap = true, silent = true, desc = "Save file"})
vim.keymap.set("i", "<a-q>", "<c-o>:q!<CR>", { noremap = true, silent = true, desc = "Save file"})
vim.keymap.set("i", "<a-s>", "<c-o>:wq!<CR>", { noremap = true, silent = true, desc = "Force quit file"})
vim.keymap.set("i", "jk", "<esc>", { noremap = true, silent = true, desc = "Normal mode"})
vim.keymap.set("n", "<leader>p", '"_diwP', { noremap = true, silent = true, desc = "Delete current textobject patest content on there"}) vim.keymap.set("v", "<leader>y", '"+y', { noremap = true, silent = true, desc = "Copy content to system clipboard"})
vim.keymap.set("v", "<leader>p", '"_dP', { noremap = true, silent = true, desc = "Delete selected text, patest content on there"})
vim.keymap.set("v", "<leader>P", '"_d"+P', { noremap = true, silent = true, desc = "Delete selected text, patest content on there"})
vim.keymap.set("n", "gj", '5j', { noremap = true, silent = true, desc = "Fast move down"})
vim.keymap.set("n", "gk", '5k', { noremap = true, silent = true, desc = "Fast move up"})
vim.keymap.set("n", "<c-h>", '<c-w>h', { noremap = true, silent = true, desc = "Focus on left"})
vim.keymap.set("n", "<c-l>", '<c-w>l', { noremap = true, silent = true, desc = "Focus on right"})
vim.keymap.set("n", "<c-j>", '<c-w>j', { noremap = true, silent = true, desc = "Focus on down"})
vim.keymap.set("n", "<c-k>", '<c-w>k', { noremap = true, silent = true, desc = "Focus on up"})

-- bufferLine
vim.keymap.set("n", "<leader>bk", "<cmd>BufferLineCyclePrev<cr>", { noremap = true, silent = true, desc = "Prev buffer" })
vim.keymap.set("n", "<leader>bj", "<cmd>BufferLineCycleNext<cr>", { noremap = true, silent = true, desc = "Next buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>", { noremap = true, silent = true, desc = "Delete buffer" })
vim.keymap.set("n", "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", { noremap = true, silent = true, desc = "Delete buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>BufferLinePick<cr>", { noremap = true, silent = true, desc = "Delete buffer" })
vim.keymap.set("n", "<leader>bc", "<cmd>BufferLinePickClose<cr>", { noremap = true, silent = true, desc = "Delete buffer" })

-- telescop 
vim.keymap.set("n", "<leader>fP", 
  function()
    local builtin = require('telescope.builtin')
    builtin.find_files({
      cwd = require("lazy.core.config").options.root
    })
  end, { desc = "Telescope find plugin file" })
vim.keymap.set("n", ";f", 
  function()
    local builtin = require('telescope.builtin')
    builtin.find_files({
      no_ignore = false,
      hidden = true
    })
  end, { desc = "Telescope list files in your current working direcotry, respect .gitignore" })
vim.keymap.set("n", ";r", 
  function()
    local builtin = require('telescope.builtin')
    builtin.live_grep({
      additional_args  = { "--hidden" }
    })
  end, { desc = "Search for a string in your current working directory and get results live as you type, respects .gitignore" })
vim.keymap.set("n", "\\\\", 
  function()
    local builtin = require('telescope.builtin')
    builtin.buffers()
  end, { desc = "Lists open buffers" })
vim.keymap.set("n", ";t", 
  function()
    local builtin = require('telescope.builtin')
    builtin.help_tags()
  end, { desc = "Lists availabel help tags and opens a new window with the relevant help info on <cr>" })
vim.keymap.set("n", ";;", 
  function()
    local builtin = require('telescope.builtin')
    builtin.resume()
  end, { desc = "Resume the previous telescope picker" })
vim.keymap.set("n", ";e", 
  function()
    local builtin = require('telescope.builtin')
    builtin.diagnostics()
  end, { desc = "Lists Diagnostics for all open buffers or a specific buffer" })
vim.keymap.set("n", ";s", 
  function()
    local builtin = require('telescope.builtin')
    builtin.treesitter()
  end, { desc = "Lists function names, variables, from Tresitter" })
vim.keymap.set("n", ";c", 
  function()
    local builtin = require('telescope.builtin')
    builtin.lsp_incoming_calls()
  end, { desc = "Lists lsp incoming calls for word under the cursor" })

-- which-key
vim.keymap.set("n", "<leader>?",
    function()
      require("which-key").show({ global = false })
    end,
    { desc = "Buffer Local Keymaps (which-key)" })

-- terminal
vim.keymap.set("n", "<leader>tt", ":split | terminal<cr>i", { noremap = true, silent = true, desc = "Open terminal" })
vim.keymap.set("n", "<leader>tv", ":vsplit | terminal<cr>i", { noremap = true, silent = true, desc = "Open terminal" })
vim.keymap.set("t", "<leader>ts", "<c-\\><c-n>", { noremap = true, silent = true, desc = "Exit terminal" })
vim.keymap.set("t", "<leader>ss", "<c-\\><c-n><c-w>k", { noremap = true, silent = true, desc = "Exit terminal" })

-- markdown
vim.keymap.set("i", "<c-m>p",
  function()
    require("render-markdown").preview()
  end,
  { desc = "Show rendered buffer to the side"})
vim.keymap.set("n", "<leader>mp",
  function()
    require("render-markdown").preview()
  end,
  { desc = "Show rendered buffer to the side"})
