local cmp = require("cmp")
local luasnip = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load()

local cmp_mapping = cmp.mapping.preset.insert({
  ["<C-j>"] = cmp.mapping.scroll_docs(4),
  ["<C-k>"] = cmp.mapping.scroll_docs(-4),
  ["<C-e>"] = cmp.mapping.abort(),
  ["<CR>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      if luasnip.expandable() then
        luasnip.expand()
      else
        cmp.confirm({
          select = true,
        })
      end
    else
      fallback()
    end
  end),

  ["<Tab>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_next_item()
    elseif luasnip.locally_jumpable(1) then
      luasnip.jump(1)
    else
      fallback()
    end
  end, { "i", "s" }),

  ["<S-Tab>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
    elseif luasnip.locally_jumpable(-1) then
      luasnip.jump(-1)
    else
      fallback()
    end
  end, { "i", "s" }),
})

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp_mapping,
  sources = cmp.config.sources({
    { name = "luasnip" },
    { name = "nvim_lsp" },
  }, {
    { name = "buffer" },
  }),
})

cmp.setup.filetype("gitcommit", {
  mapping = cmp_mapping,
  sources = cmp.config.sources({
    { name = "git" },
  }, {
    { name = "buffer" },
  }),
})

require("cmp_git").setup({})
