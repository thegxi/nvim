local L = {}

local data_dir = vim.fn.stdpath("data")
local lazypath = data_dir .. "/lazy/lazy.nvim"

function L:lazy_pack()
    if not (vim.uv or vim.loop).fs_stat(lazypath) then
        local lazyrepo = "https://github.com/folke/lazy.nvim.git"
        local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
        if vim.v.shell_error ~= 0 then
            vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
            }, true, {})
            vim.fn.getchar()
            os.exit(1)
        end
    end
    local settings = {
        git =  {
            timeout = 300,
            url_format = "https://github.com/%s.git"
        },
        install = {
            missing = true,
            -- colorscheme = { "tokyonight" }
            colorscheme = { "habamax" }
        },
        ui = {
            size = { width = 0.88, height = 0.8 },
			wrap = true,
            border = "rounded",
            icons = {
                cmd = " ",
                config = "",
                debug = "● ",
                event = " ",
                favorite = " ",
                ft = " ",
                init = " ",
                import = " ",
                keys = " ",
                lazy = "󰒲 ",
                loaded = "●",
                not_loaded = "○",
                plugin = " ",
                runtime = " ",
                require = "󰢱 ",
                source = " ",
                start = " ",
                task = "✔ ",
                list = {
                    "●",
                    "➜",
                    "★",
                    "‒"
                }
            }
        },
        performance = {
            cache = {
            enabled = true,
            },
            reset_packpath = true, -- reset the package path to improve startup time
            rtp = {
                reset = true, -- reset the runtime path to $VIMRUNTIME and your config directory
                ---@type string[]
                paths = {}, -- add any custom paths here that you want to includes in the rtp
                ---@type string[] list any plugins you want to disable here
                disabled_plugins = {
                    -- "gzip",
                    -- "matchit",
                    -- "matchparen",
                    -- "netrwPlugin",
                    -- "tarPlugin",
                    -- "tohtml",
                    -- "tutor",
                    -- "zipPlugin",
                },
            },
        },
        spec = {
            { import = "plugins" },
        }
    }
    vim.opt.rtp:prepend(lazypath)
    require("lazy").setup(settings)
end

L:lazy_pack()
