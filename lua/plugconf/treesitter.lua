local CONF = {}

function CONF.config()
    CONF.hi({
        ["@variable"] = {fg="NONE"};
        ["@function"] = {fg=32};
        ["@function.call"] = {fg=32};
        ["@operator"] = {fg=166};
        ["@keyword.operator"] = {fg=166};

        ["@property"] = {fg=172};
        ["@field"]= {fg=150};
        ["@method"] = {fg=166};
        ["@method.call"] = {fg=9};
        ["@parameter"] = {fg=9};

        ["@keyword"] = {fg=1};
        ["@keyword.function"] = {fg=32};
        ["@exception"] = {fg=32};

        ["@statement"] = {fg=166};
        ["@special"] = {fg=172};
        ["@comment"]= {fg=71,sp='italic'};
        ["@include"] = {fg=1};
        ["@type"] = {fg=179};
        ["@type.builtin"] = {fg=150};
        ["@punctuation.bracket"] = {fg=151};

        ["@constructor"] = {fg=172};
        ["@namespace"] = {fg=172};

        ["@string"] = {fg=37};
        ["@number"] = {fg=37};
        ["@boolean"] = {fg=37};

        ["@tag"] = {fg=172};

        ["@text.literal"] = {fg=7}
    })
    vim.api.nvim_set_keymap("n", "H", ":TSHighlightCapturesUnderCursor<CR>", {silent = true, noremap = true})
end

function CONF.setup()
    require('nvim-treesitter.configs').setup {
        ensure_installed = "all",
        ignore_install = { "swift", "phpdoc" },
        highlight = {
            enable = true
        },
    }
end

function CONF.hi(hls)
  for group,color in pairs(hls) do
        local fg = color.fg and ' ctermfg=' .. color.fg or ' ctermfg=NONE'
        local bg = color.bg and ' ctermbg=' .. color.bg or ' ctermbg=NONE'
        local sp = color.sp and ' cterm=' .. color.sp or ''
        vim.api.nvim_command('highlight ' .. group .. fg .. bg .. sp)
    end
end

return CONF
