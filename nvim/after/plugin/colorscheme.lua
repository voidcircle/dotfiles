local now = require("mini.deps").now

now(function()
	require("nvim-web-devicons").setup({})
	require("solarized-osaka").setup({
		transparent = true,
		terminal_colors = true,
		styles = {
			comments = { italic = true },
			keywords = { italic = true },
			functions = {},
			variables = {},
			sidebars = "dark",
			floats = "dark",
		},
		dim_inactive = true,
		lualine_bold = true,
		on_highlights = function(highlights, colors)
			highlights.Visual = { bg = colors.base02, reverse = true }
		end,
	})

	vim.cmd([[ colorscheme solarized-osaka ]])
end)
