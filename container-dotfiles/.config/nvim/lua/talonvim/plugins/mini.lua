return {
  'echasnovski/mini.nvim',
  config = function()
    require('mini.ai').setup { n_lines = 500 }
    require('mini.sessions').setup()
    require('mini.surround').setup()
    require('mini.icons').setup()
  end,
}
