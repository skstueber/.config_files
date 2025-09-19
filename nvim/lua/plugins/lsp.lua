return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
  },

  config = function()
    local cmp = require('cmp')
    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      cmp_lsp.default_capabilities())

    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "clangd",
        "pyright",
        "ts_ls",
        "html",
        "cssls",
        "bashls",
        "jsonls",
      },
      handlers = {
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup {
            capabilities = capabilities
          }
          local opts = {}
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        end,

        ["lsp-installer"] = function()
          local lspconfig = require("lspconfig")
          vim.lsp.enable('lua_ls')
          vim.lsp.configure('lua_ls', {
            capabilities = capabilities,
            settings = {
              Lua = {
                format = {
                  enable = true,
                  -- Put format options here
                  -- NOTE: the value should be STRING!!
                  --[[ defaultConfig = {
                    indent_style = "space",
                    indent_size = "2",
                  } ]]
                },
              }
            }
          })
          vim.lsp.enable('clangd')
          vim.lsp.configure('clangd', {
            capabilities = capabilities,
          })
          vim.lsp.enable('pyright')
          vim.lsp.configure('pyright', {
            capabilities = capabilities,
          })
          vim.lsp.enable('ts_ls')
          vim.lsp.configure('ts_ls', {
            capabilities = capabilities,
          })
          vim.lsp.enable('html')
          vim.lsp.configure('html', {
            capabilities = capabilities,
          })
          vim.lsp.enable('cssls')
          vim.lsp.configure('cssls', {
            capabilities = capabilities,
          })
          vim.lsp.enable('bashls')
          vim.lsp.configure('bashls', {
            capabilities = capabilities,
          })
          vim.lsp.enable('jsonls')
          vim.lsp.configure('jsonls', {
            capabilities = capabilities,
          })
        end,
      }
    })

    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      }),
      sources = cmp.config.sources({
        { name = "copilot", group_index = 2 },
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
      }, {
        { name = 'buffer' },
      })
    })

    vim.diagnostic.config({
      -- update_in_insert = true,
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })
  end
}
