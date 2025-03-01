return {
  'OXY2DEV/markview.nvim',
  lazy = false,

  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    block_quotes = {
      enable = true,

      default = {
        border = '▋',
      },
      callouts = nil,
    },
    Checkboxes = {
      enable = true,

      checked = {
        text = '✔',
        hl = 'TabLineSel',
      },
      unchecked = {},
      pending = {},

      custom = {
        {
          match = '~',
          text = '◕',
          hl = 'CheckboxProgress',
        },
      },
    },
    code_blocks = {
      enable = true,
      style = 'language',
      border_hl = 'CursorLine',
    },
    headings = {
      enable = true,

      textoff = 0,
      shift_width = 0,

      heading_1 = {
        style = 'simple',

        shift_char = ' ',
        hl = 'DiagnosticOk',
      },
      heading_2 = {},
      heading_3 = {},
      heading_4 = {},
      heading_5 = {},
      heading_6 = {},

      setext_1 = {},
      setext_2 = {},
    },
  },
  horizontal_rules = {
    enable = true,

    parts = {
      {
        type = 'repeating',

        repeat_amount = 10,
        text = '-',
        hl = 'Special',
      },
    },
  },
  links = {
    enable = true,

    hyperlinks = {},
    images = {},
    emails = {},
  },
  list_items = {
    enable = true,
    shift_width = 2,
    indent_size = 2,

    marker_minus = {},
    marker_plus = {},
    marker_star = {},
    marker_dot = {},
  },
  tables = {
    enable = true,
    use_virt_lines = false,

    text = {},
    hl = {},
  },
}
