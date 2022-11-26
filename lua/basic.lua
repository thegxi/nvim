-- scope global 
local vg = vim.g
-- scope buffer and window
local vo = vim.o

-- set mapleader
vg.mapleader = " "

-- encoding
vo.encoding = "utf-8"
vo.fileencoding = "utf-8"

-- number line
vo.number = true
vo.relativenumber = true

-- highlight current line
vo.cursorline = true

-- indent
vo.tabstop = 2
vo.tabstop = 2
vo.softtabstop = 2
vo.shiftround = true

-- >> << move step
vo.shiftwidth = 2

-- blank instead tab
vo.expandtab = true

-- align
vo.autoindent = true
vo.smartindent = true

-- search ignore case
vo.ignorecase = true
vo.smartcase = true

-- search no highlight
vo.hlsearch = false

-- now search
vo.incsearch = true

-- use 24-bit RGB in the TUI
vo.termguicolors = true

-- backup 
vo.backup = false

-- auto load
vo.autoread = true

-- split window from below and right
vo.splitbelow = true
vo.splitright = true



