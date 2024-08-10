local opt = vim.opt

opt.number = true -- Enables line numbers
opt.relativenumber = true -- Enables relative line numbers
opt.autoindent = true -- Indent automatically
opt.cursorline = true -- Enables cursor line
opt.ignorecase = true -- Ignore case when searching
opt.splitright = true -- Split to the right on vertical
opt.splitbelow = true -- Split below when horizontal
opt.swapfile = false -- Don't use swap files (I use auto-save.nvim instead)
opt.wrap = true -- Wrap lines
opt.updatetime = 100 -- mainly for trld.nvim which utilize CursorHold autocmd
opt.formatoptions:append('cro') -- continue comments when going down a line, hit C-u to remove the added comment prefix
opt.sessionoptions:remove('options') -- don't save keymaps and local options
opt.foldlevelstart = 99 -- no auto folding

vim.cmd[[colorscheme tokyonight-storm]]
