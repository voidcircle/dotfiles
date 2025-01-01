local lint = require("lint")

lint.events = { "BufWritePost", "BufReadPost", "InsertLeave" }

lint.linters_by_ft = {
	javascript = { "biomejs" },
	typescript = { "biomejs" },
	javascriptreact = { "biomejs" },
	typescriptreact = { "biomejs" },
	svelte = { "eslint" },
	python = { "flake8" },
	git = { "gitlint" },
	fish = { "fish" },
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lint_augroup,
	callback = function()
		lint.try_lint()
	end,
})
