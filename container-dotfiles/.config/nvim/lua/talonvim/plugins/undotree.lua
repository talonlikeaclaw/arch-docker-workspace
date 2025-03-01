return {
  'jiaoshijie/undotree',
  dependencies = 'nvim-lua/plenary.nvim',
  config = function()
    require('undotree').setup {
      -- Add any custom configuration options here
      float_diff = true,
      layout = 'left_bottom',
      position = 'left',
      window = { winblend = 30 },
      keymaps = {
        ['j'] = 'move_next',
        ['k'] = 'move_prev',
        ['gj'] = 'move_next_sibling',
        ['gk'] = 'move_prev_sibling',
        ['<cr>'] = 'action_enter',
        ['o'] = 'action_enter',
        ['q'] = 'quit',
      },
    }
  end,
  keys = {
    { '<leader>u', "<cmd>lua require('undotree').toggle()<cr>", desc = 'Toggle UndoTree' },
  },
}
