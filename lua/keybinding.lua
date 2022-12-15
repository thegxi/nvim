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

keymap("c", "<c-a>",      "<home>",     { noremap = true })
keymap("c", "<c-e>",      "<end>",      { noremap = true })
keymap("c", "<up>",       "<c-p>",      { noremap = true })
keymap("c", "<down>",     "<c-n>",      { noremap = true })

-- ========= virsual indent ========= 
keymap("v", "<",          "<gv",        { noremap = true })
keymap("v", ">",          ">gv",        { noremap = true })
keymap("v", "<s-tab>",    "<gv",        { noremap = true })
keymap("v", "<tab>",      ">gv",        { noremap = true })

-- ========= fast save ========= 
keymap("n", "<leader>w",   ":w<cr>",          opt)
keymap("n", "<leader>q",   ":wq<cr>",         opt)
keymap("i", "<leader>w",   "<esc>:w<cr>i",     opt)
keymap("i", "<leader>q",   "<esc>:wq<cr>",    opt)

-- ========= move line ========= 
keymap("n", "<a-up>",     ":m .-2<cr>",       opt)
keymap("n", "<a-down>",   ":m .+1<cr>",       opt)
keymap("i", "<a-up>",     "<esc>:m .-2<cr>i", opt)
keymap("i", "<a-down>",   "<esc>:m .+1<cr>i", opt)
keymap("v", "<a-up>",     ":m '<-2<cr>gv",    opt)
keymap("v", "<a-down>",   ":m '>+1<cr>gv",    opt)

-- ========= select text ========= 
keymap("i", "<s-down>",   "<esc>vj",  { noremap = true })
keymap("i", "<s-up>",     "<esc>vk",  { noremap = true })
keymap("n", "<s-up>",     "Vk",       { noremap = true })
keymap("n", "<s-down>",   "Vj",       { noremap = true })
keymap("v", "<s-up>",     "k",        { noremap = true })
keymap("v", "<s-down>",   "j",        { noremap = true })
keymap("n", "<s-left>",   "vh",       { noremap = true })
keymap("n", "<s-right>",  "vl",       { noremap = true })
keymap("n", "<a-a>",      "ggVG",     { noremap = true })
keymap("n", "a-s",        "vi{",      { noremap = true })

-- ========= windows ========= 
keymap("n", "sv",         ":vsp<cr><c-w>w", { noremap = true })
keymap("n", "sp",         ":sp<cr><c-w>w",  { noremap = true })
keymap("n", "sc",         ":close<cr>",     { noremap = true })
keymap("n", "so",         ":only<cr>",      { noremap = true })
keymap("n", "<leader>h",  "<c-w>h",         { noremap = true })
keymap("n", "<leader>l",  "<c-w>l",         { noremap = true })
keymap("n", "<leader>k",  "<c-w>k",         { noremap = true })
keymap("n", "<leader>j",  "<c-w>j",         { noremap = true })
keymap("n", "<a-space>",  "<c-w>w",         { noremap = true })

-- ========= buffers ========= 
keymap("n", "W",          ":bw<cr>", opt)
keymap("n", "<ctrl><s><tab>",         ":bn<cr>", opt)
keymap("n", "<a-left>",   ":bp<cr>", opt)
keymap("n", "<a-right>",  ":bn<cr>", opt)
keymap("v", "<a-left>",   ":bp<cr>", opt)
keymap("v", "<a-right>",  ":bn<cr>", opt)
keymap("i", "<a-left>",   ":bp<cr>", opt)
keymap("i", "<a-right>",  ":bn<cr>", opt)

-- ========= lazygit ========= 
keymap("n", "<a-g>", ":new<cr>:term lazygit<cr>i", opt)

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

-- ========= float terminal ========= 
-- open 10 hight 10 lines float terminal
keymap("n", "tt", ":below 10sp | term<cr>a", opt)

-- ========= markdown ========= 
keymap("n", "<leader>p", ":MarkdownPreviewToggle<cr>", opt)

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
  { key = "d",          action = "remove" },
  { key = "h",          action = "toggle_custom" },
  { key = "r",          action = "rename" },
  { key = "c",          action = "copy" },
  { key = "gy",         action = "copy_absoulute_path" },
}

return pluginKeyMap

