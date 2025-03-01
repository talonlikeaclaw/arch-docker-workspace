return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'S1M0N38/love2d.nvim',
  },
  config = function()
    local lspconfig = require 'lspconfig'
    local lspui = require 'lspconfig.ui.windows'
    local cmp_nvim_lsp = require 'cmp_nvim_lsp'
    local capabilities = cmp_nvim_lsp.default_capabilities()

    local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }
    for type, icon in pairs(signs) do
      local hl = 'DiagnosticSign' .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
    end

    --LspInfo Borders
    lspui.default_options.border = 'double'

    -- html
    lspconfig.html.setup {
      capabilities = capabilities,
    }

    -- configure emmet language server
    lspconfig.emmet_ls.setup {
      capabilities = capabilities,
      filetypes = { 'html', 'css' },
    }

    -- Lua LS
    lspconfig.lua_ls.setup {
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT for LÖVE)
            version = 'LuaJIT',
          },
          diagnostics = {
            globals = { 'vim', 'love' },
            disable = {
              'missing-fields',
              'incomplete-signature-doc',
              'duplicate-set-field',
              'lowercase-global',
              'unused-local',
            },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file('', true),
            checkThirdParty = false, -- Disable third-party checking
          },
          telemetry = {
            enable = false,
          },
        },
      },
      on_init = function(client)
        local path = client.workspace_folders[1].name
        if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
          client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
            Lua = {
              runtime = {
                -- Setup your lua path
                path = vim.split(package.path, ';'),
              },
              workspace = {
                library = { vim.env.VIMRUNTIME },
              },
            },
          })

          client.notify('workspace/didChangeConfiguration', { settings = client.config.settings })
        end
        return true
      end,
    }
    -- CSS LS
    lspconfig.cssls.setup {
      capabilities = capabilities,
    }

    lspconfig.eslint.setup {
      capabilities = capabilities,
      filetypes = { 'javascript' },
    }

    lspconfig.ts_ls.setup {
      capabilities = capabilities,
      filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
    }

    -- Python LS
    lspconfig.pylsp.setup {
      capabilities = capabilities,
      settings = {
        pylsp = {
          plugins = {
            pycodestyle = {
              maxLineLength = 88,
              ignore = { 'E501', 'D100' },
            },
            pylint = {
              enabled = true,
              args = { '--disable=C0116', '--disable=C0114', '--disable=C0301', '--disable=C0303' },
              pyflakes = { enabled = true },
              black = { enabled = true },
              autopep8 = { enabled = false },
            },
          },
        },
      },
    }
  end,
}
