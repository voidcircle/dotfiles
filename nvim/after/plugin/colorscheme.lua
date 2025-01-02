local now = require("mini.deps").now

now(function()
  require("nvim-web-devicons").setup({})

  require("modus-themes").setup({
    transparent = true,
    terminal_colors = true,
    dim_inactive = false,
    hide_inactive_statusline = false,
    styles = {
      comments = { italic = true },
      keywords = { italic = true },
      functions = { bold = true, italic = true },
      variables = {},
    },
    on_colors = function(colors) end,
    on_highlights = function(highlights, colors)
      highlights.Visual = { bg = colors.base02, reverse = true }
    end,
  })

  vim.cmd([[colorscheme modus]])
end)
