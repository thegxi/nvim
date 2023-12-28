return function()
	vim.g["suda#prompt"] = "Enter administrator password: "

	require("suda").setup("suda", nil, true)
end
