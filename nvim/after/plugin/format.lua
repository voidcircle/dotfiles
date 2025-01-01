local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		javascript = { "biome" },
		javascriptreact = { "biome" },
		typescript = { "biome" },
		typescriptreact = { "biome" },
		html = { "prettier" },
		css = { "prettier" },
		scss = { "prettier" },
		less = { "prettier" },

		json = { "prettier" },
		jsonc = { "prettier" },
		yaml = { "prettier" },

		python = { "black" },

		markdown = { "prettier" },
		["markdown.mdx"] = { "prettier" },

		rust = { "rustfmt" },
		lua = { "stylua" },

		fish = { "fish_indent" },
		sh = { "shfmt" },
	},
	format_on_save = {
		lsp_fallback = true,
		async = false,
		timeout_ms = 100000,
	},
})
