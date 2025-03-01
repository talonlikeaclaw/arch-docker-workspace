return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  enabled = true,
  opts = {
    preset = 'helix',
    expand = 0,
    spec = {
      {
        mode = { 'n', 'v' },
        { '<leader>b', group = 'bufferline', icon = { icon = '󰈔', color = 'orange' } },
        { '<leader>c', group = 'code', icon = { icon = ' ', color = 'azure' } },
        { '<leader>f', group = 'find', icon = { icon = '"', color = 'cyan' } },
        { '<leader>v', group = 'love2d', icon = { icon = '󰈸', color = 'yellow' } },
        { '<leader>g', group = 'git', icon = { icon = '󰈸', color = 'orange' } },
        { '<leader>o', group = 'obsidian', icon = { icon = '󰵅 ', color = 'purple' } },
        { '<leader>m', group = 'music', icon = { icon = '󱅻 ', color = 'red' } },
        { '<leader>t', group = 'tools', icon = { icon = ' ', color = 'grey' } },
        { '<leader>u', group = 'ui', icon = { icon = '󰵅 ', color = 'green' } },
        { '<leader>s', group = 'search', icon = { icon = ' ', color = 'cyan' } },
        { '<leader>w', group = 'window' },
        { '<leader>F', group = 'format' },
        { '<leader>C', icon = { icon = '󰙵 ' } },
        { '<leader>/' },
        { '<leader> ' },
        { '<leader>q' },
        { '<leader>Q' },
      },
    },
    win = {
      no_overlap = false,
      title_pos = 'center',
    },
    sort = { 'manual', 'group', 'lower' },
  },
}
--
-- --- * `WhichKeyColorAzure`  - azure.
-- --- * `WhichKeyColorBlue`   - blue.
-- --- * `WhichKeyColorCyan`   - cyan.
-- --- * `WhichKeyColorGreen`  - green.
-- --- * `WhichKeyColorGrey`   - grey.
-- --- * `WhichKeyColorOrange` - orange.
-- --- * `WhichKeyColorPurple` - purple.
-- --- * `WhichKeyColorRed`    - red.
-- --- * `WhichKeyColorYellow` - yellow.
--
-- ---@type wk.IconRule[]
-- M.rules = {
--   { plugin = "fzf-lua", cat = "filetype", name = "fzf" },
--   { plugin = "neo-tree.nvim", cat = "filetype", name = "neo-tree" },
--   { plugin = "octo.nvim", cat = "filetype", name = "git" },
--   { plugin = "yanky.nvim", icon = "󰅇", color = "yellow" },
--   { plugin = "zen-mode.nvim", icon = "󱅻 ", color = "cyan" },
--   { plugin = "telescope.nvim", pattern = "telescope", icon = "", color = "blue" },
--   { plugin = "trouble.nvim", cat = "filetype", name = "trouble" },
--   { plugin = "todo-comments.nvim", cat = "file", name = "TODO" },
--   { plugin = "nvim-spectre", icon = "󰛔 ", color = "blue" },
--   { plugin = "grug-far.nvim", pattern = "grug", icon = "󰛔 ", color = "blue" },
--   { plugin = "noice.nvim", pattern = "noice", icon = "󰈸", color = "orange" },
--   { plugin = "persistence.nvim", icon = " ", color = "azure" },
--   { plugin = "neotest", cat = "filetype", name = "neotest-summary" },
--   { plugin = "lazy.nvim", cat = "filetype", name = "lazy" },
--   { plugin = "CopilotChat.nvim", icon = " ", color = "orange" },
--   { pattern = "%f[%a]git", cat = "filetype", name = "git" },
--   { pattern = "terminal", icon = " ", color = "red" },
--   { pattern = "find", icon = " ", color = "green" },
--   { pattern = "search", icon = " ", color = "green" },
--   { pattern = "test", cat = "filetype", name = "neotest-summary" },
--   { pattern = "lazy", cat = "filetype", name = "lazy" },
--   { pattern = "buffer", icon = "󰈔", color = "cyan" },
--   { pattern = "file", icon = "󰈔", color = "cyan" },
--   { pattern = "window", icon = " ", color = "blue" },
--   { pattern = "diagnostic", icon = "󱖫 ", color = "green" },
--   { pattern = "format", icon = " ", color = "cyan" },
--   { pattern = "debug", icon = "󰃤 ", color = "red" },
--   { pattern = "code", icon = " ", color = "orange" },
--   { pattern = "notif", icon = "󰵅 ", color = "blue" },
--   { pattern = "toggle", icon = " ", color = "yellow" },
--   { pattern = "session", icon = " ", color = "azure" },
--   { pattern = "exit", icon = "󰈆 ", color = "red" },
--   { pattern = "quit", icon = "󰈆 ", color = "red" },
--   { pattern = "tab", icon = "󰓩 ", color = "purple" },
--   { pattern = "%f[%a]ai", icon = " ", color = "green" },
--   { pattern = "ui", icon = "󰙵 ", color = "cyan" },
