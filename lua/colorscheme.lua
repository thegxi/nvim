-- vim.api.nvim_command('colorscheme everforest')
-- vim.api.nvim_command('colorscheme Nightfox')
-- vim.api.nvim_command('colorscheme solarized8_high')

-- local colorscheme = "tokyonight"
-- local colorscheme = "gruvbox"
-- local colorscheme = "zephyr"
vim.api.nvim_command([[
 colorscheme solarized8_high
 set cmdheight=1
 set updatetime=300
 set shortmess+=cI
 set scrolloff=5
 set noshowmode
 set nu
 set numberwidth=2
 set cul
 set signcolumn=yes
 let &t_SI.="\e[5 q"
 let &t_EI.="\e[1 q"
 set fillchars=stlnc:#
]])
