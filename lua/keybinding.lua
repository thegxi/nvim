-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- set blank for leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = { noremap = true, silent = true, }

local keymap = vim.api.nvim_set_keymap

-- ========= move ========= 
keymap("n", "<c-j>", "5j",  opt)
keymap("n", "<c-k>", "5k",  opt)
keymap("v", "<c-k>", "5k",  opt)
keymap("v", "<c-k>", "5k",  opt)
keymap("n", "<c-u>", "10k", opt)
keymap("n", "<c-d>", "10j", opt)

-- ========= fast save ========= 
keymap("n", "<leader>w", ":w<cr>",  opt)
keymap("n", "<leader>q", ":wq<cr>", opt)

-- ========= windows ========= 
keymap("n", "sv",         ":vsp<cr><C-w>w", { noremap = true })
keymap("n", "sp",         ":sp<cr><C-w>w",  { noremap = true })
keymap("n", "sc",         ":close<cr>",     { noremap = true })
keymap("n", "so",         ":only<cr>",      { noremap = true })
keymap("n", "s<left>",    "<c-w>h",         { noremap = true })
keymap("n", "s<right>",   "<c-w>l",         { noremap = true })
keymap("n", "s<up>",      "<c-w>k",         { noremap = true })
keymap("n", "s<down>",    "<c-w>j",         { noremap = true })
keymap("n", "<a-space>",  "<c-w>w",         { noremap = true })

-- ========= buffers ========= 
keymap("n", "W",          ":bw<cr>", opt)
keymap("n", "ss",         ":bn<cr>", opt)
keymap("n", "<a-left>",   ":bp<cr>", opt)
keymap("n", "<a-right>",  ":bn<cr>", opt)
keymap("v", "<a-left>",   ":bp<cr>", opt)
keymap("v", "<a-right>",  ":bn<cr>", opt)
keymap("i", "<a-left>",   ":bp<cr>", opt)
keymap("i", "<a-right>",  ":bn<cr>", opt)

local pluginKeyMap = {}

-- ========= coc.nvim ========= 
pluginKeyMap.cocKeyMap = function() 
  keymap("n", "<F2>",     "<Plug>(coc-rename)",               opt)
  keymap("n", "gd",       "<Plug>(coc-definition)",           opt)
  keymap("n", "gy",       "<Plug>(coc-type-definition)",      opt)
  keymap("n", "gi",       "<Plug>(coc-implementation)",       opt)
  keymap("n", "gr",       "<Plug>(coc-references)",           opt)
  keymap("x", "if",       "<Plug>(coc-funcobj-i)",            opt)
  keymap("o", "if",       "<Plug>(coc-funcobj-i)",            opt)
  keymap("x", "af",       "<Plug>(coc-funcobj-a)",            opt)
  keymap("o", "af",       "<Plug>(coc-funcobj-a)",            opt)
  keymap("x", "ic",       "<Plug>(coc-classobj-i)",           opt)
  keymap("o", "ic",       "<Plug>(coc-classobj-i)",           opt)
  keymap("x", "ac",       "<Plug>(coc-classobj-a)",           opt)
  keymap("o", "ac",       "<Plug>(coc-classobj-a)",           opt)
  keymap("n", "K",        ":call CocAction('doHover')<cr>",   opt)
  keymap("i", "<TAB>",    "coc#pum#visible() ? coc#pum#next(1) : col('.') == 1 || getline('.')[col('.') - 2] =~# '\\s' ? \"\\<TAB>\" : coc#refresh()", {silent = true, noremap = true, expr = true} )
  keymap("i", "<s-tab>",  "coc#pum#visible() ? coc#pum#prev(1) : \"\\<s-tab>\"", {silent = true, noremap = true, expr = true} )
  keymap("i", "<cr>",     "coc#pum#visible() ? coc#_select_confirm() : \"\\<c-g>u\\<cr>\\<c-r>=coc#on_enter()\\<cr>\"", {silent = true, noremap = true, expr = true} )
  keymap("i", "<c-y>",    "coc#pum#visible() ? coc#_select_confirm() : '<c-y>'", {silent = true, noremap = true, expr = true} )
  keymap("n", "<F3>",     ":silent CocRestart<cr>", {silent = true, noremap = true} )
  keymap("n", "<F4>",     "get(g:, 'coc_enabled', 0) == 1 ? ':CocDisable<cr>' : ':CocEnable<cr>'", {silent = true, noremap = true, expr = true} )
  keymap("n", "<F9>",     ":CocCommand snippets.editSnippets<cr>", {silent = true, noremap = true} )
  keymap("n", "<c-e>",    ":CocList --auto-preview diagnostics<cr>", opt)
  keymap("n", "mm",       "<Plug>(coc-translator-p)",   opt)
  keymap("v", "mm",       "<Plug>(coc-translator-pv)",  opt)
  keymap("n", "(",        "<Plug>(coc-git-prevchunk)",  opt)
  keymap("n", ")",        "<Plug>(coc-git-nextchunk)",  opt)
  keymap("n", "C",        "get(b:, 'coc_git_blame', '') ==# 'Not committed yet' ? \"<Plug>(coc-git-chunkinfo)\" : \"<Plug>(coc-git-commit)\"", {silent = true, expr = true} )
  keymap("n", "\\g",      ":call coc#config('git.addGBlameToVirtualText',  !get(g:coc_user_config, 'git.addGBlameToVirtualText', 0)) | call nvim_buf_clear_namespace(bufnr(), -1, line('.') - 1, line('.'))<cr>", opt)
end 

-- ========= nvim-tree ========= 
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opt)
pluginKeyMap.treeKeyMap = {
  { key = "P",          action = "cd" },
  { key = "<BS>",       action = "dir_up" },
  { key = "<Esc>",      action = "close" },
  { key = "<Tab>",      action = "expand" },
  { key = "<Right>",    action = "expand" },
  { key = "<Left>",     action = "close_node" },
  { key = ">",          action = "next_git_item" },
  { key = "<",          action = "prev_git_item" },
  { key = "?",          action = "toggle_help" },
  { key = "A",          action = "create" },
}

return pluginKeyMap

