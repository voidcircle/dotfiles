local cmp = require("cmp")
local luasnip = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load()

local kind_icons = {
  Text = "󰉿",
  Method = "󰆧",
  Function = "󰊕",
  Constructor = "",
  Field = "󰜢",
  Variable = "󰀫",
  Class = "󰠱",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "󰑭",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈙",
  Reference = "󰈇",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰏿",
  Struct = "󰙅",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "",
}

local menu_icons = {
  buffer = "[BFR]",
  nvim_lsp = "[LSP]",
  luasnip = "[LSN]",
  nvim_lua = "[LUA]",
  latex_symbols = "[LTX]",
}

local cmp_mapping = cmp.mapping.preset.insert({
  ["<C-j>"] = cmp.mapping.scroll_docs(1),
  ["<C-k>"] = cmp.mapping.scroll_docs(-1),
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
    completion = cmp.config.window.bordered({
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
      max_width = 20,
      max_height = 10,
    }),
    documentation = cmp.config.window.bordered({
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
      max_width = 60,
      max_height = 15,
    }),
  },
  mapping = cmp_mapping,
  sources = cmp.config.sources({
    { name = "luasnip" },
    { name = "nvim_lsp" },
  }, {
    { name = "buffer" },
  }),
  formatting = {
    format = function(entry, vim_item)
      -- Ensure vim_item.kind is not nil
      vim_item.kind = vim_item.kind or ""

      vim_item.kind = kind_icons[vim_item.kind] .. " " .. string.sub(string.upper(vim_item.kind), 0, 3)
      vim_item.menu = menu_icons[entry.source.name]
      return vim_item
    end,
  },
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
