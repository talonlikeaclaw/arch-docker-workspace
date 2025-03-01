return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local conform = require 'conform'

    conform.setup {
      formatters_by_ft = {
        css = { 'prettier' },
        html = { 'prettier' },
        javascriptreact = { 'prettier' },
        javascript = { 'prettier' },
        json = { 'prettier' },
        lua = { 'stylua' },
        markdown = { 'prettier' },
        python = { 'black' },
        typescript = { 'prettier' },
        yaml = { 'prettier' },
      },
      formatters = {
        prettier = {
          prepend_args = { '--print-width', '80', '--tab-width', '2' },
        },
      },
      format_on_save = false,
    }
    vim.keymap.set({ 'n', 'v' }, '<leader>cf', function()
      conform.format {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      }
    end, { desc = 'format' })
  end,
}
