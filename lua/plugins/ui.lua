return {
    { 
        "datsfilipe/vesper.nvim",
        config = function (_, opts)
            require("vesper").setup({
                transparent = false,
                italics = {
                    comments = true,
                    keywords = true,
                    functions = true,
                    strings = true,
                    variables = true,
                },
                overrides = {},
                palette_overrides = {}
            })
            vim.cmd("colorscheme vesper")
        end
    },
}
