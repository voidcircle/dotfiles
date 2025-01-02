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
add("tjdevries/colorbuddy.nvim")
add("miikanissi/modus-themes.nvim")
add("nvim-treesitter/nvim-treesitter")

-- Language Servers
add("neovim/nvim-lspconfig")
add("williamboman/mason.nvim")
add("williamboman/mason-lspconfig.nvim")
add("nvimdev/lspsaga.nvim")

-- Cmps
add("neovim/nvim-lspconfig")
add("hrsh7th/cmp-nvim-lsp")
add("hrsh7th/cmp-buffer")
add("hrsh7th/cmp-path")
add("hrsh7th/cmp-cmdline")
add("hrsh7th/nvim-cmp")
add("L3MON4D3/LuaSnip")
add("saadparwaiz1/cmp_luasnip")
add("petertriho/cmp-git")
add("rafamadriz/friendly-snippets")

-- Formatter & Linters & DAP
add("stevearc/conform.nvim")
add("mfussenegger/nvim-lint")
add("mfussenegger/nvim-dap")
add("rcarriga/nvim-dap-ui")

-- File Type Specific
add("iamcco/markdown-preview.nvim")

-- Language Specific
add("luckasRanarison/tailwind-tools.nvim") -- Tailwind CSS
