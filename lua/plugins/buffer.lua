return {
  "akinsho/bufferline.nvim",
  version = "*",
  opts = {
    options = {
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function (_, _, diagnostics_dict, _)
            local indicator = " "
            for level, number in pairs(diagnostics_dict) do
                local symbol
                if level == "error" then
                    symbol = " "
                elseif level == "warning" then
                    symbol = " "
                else
                    symbol = " "
                end
                indicator = indicator .. number .. symbol
            end
            return indicator
        end
    }
  },
  lazy = false,
  dependencies = "nvim-tree/nvim-web-devicons"
}
