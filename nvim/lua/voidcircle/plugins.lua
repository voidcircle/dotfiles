local path_package = vim.fn.stdpath("data") .. "/site"
local mini_path = path_package .. "/pack/deps/start/mini.nvim"
if not vim.loop.fs_stat(mini_path) then
	vim.cmd('echo "Installing `mini.nvim`" | redraw')
	local clone_cmd = {
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/echasnovski/mini.nvim",
		mini_path,
	}
	vim.fn.system(clone_cmd)
	vim.cmd("packadd mini.nvim | helptags ALL")
end

local MiniDeps = require("mini.deps")

MiniDeps.setup({ path = { package = path_package } })

local add = MiniDeps.add

-- Package manager
add("echasnovski/mini.nvim")

-- Theme
add("nvim-tree/nvim-web-devicons")
add("nvim-lua/plenary.nvim")
add("craftzdog/solarized-osaka.nvim")
add("nvim-treesitter/nvim-treesitter")

-- Language Servers
add("neovim/nvim-lspconfig")
add("williamboman/mason.nvim")
add("williamboman/mason-lspconfig.nvim")
add("nvimdev/lspsaga.nvim")

-- Formatter & Linters & DAP
add("stevearc/conform.nvim")
add("mfussenegger/nvim-lint")
add("mfussenegger/nvim-dap")
add("rcarriga/nvim-dap-ui")

-- File Type Specific
add("iamcco/markdown-preview.nvim")

-- Language Specific
add("luckasRanarison/tailwind-tools.nvim") -- Tailwind CSS
