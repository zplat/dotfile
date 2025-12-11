return {
  'numToStr/Comment.nvim',
  event = 'VeryLazy', -- Special lazy.nvim event for things that can load later and are not important for the initial UI
  config = function()
    require('Comment').setup()
  end,
  keys = {
    { 'gcc', mode = 'n', desc = 'Comment toggle current line' },
    { 'gc', mode = { 'n', 'o' }, desc = 'Comment toggle linewise' },
    { 'gc', mode = 'x', desc = 'Comment toggle linewise (visual)' },
    { 'gbc', mode = 'n', desc = 'Comment toggle current block' },
    { 'gb', mode = { 'n', 'o' }, desc = 'Comment toggle blockwise' },
    { 'gb', mode = 'x', desc = 'Comment toggle blockwise (visual)' },
  },
}
