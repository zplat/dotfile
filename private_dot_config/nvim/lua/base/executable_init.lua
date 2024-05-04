return {
  { "tpope/vim-sleuth", event = "VeryLazy" }, -- auto adjust 'shiftwidth'/'expandtab' heuristically based on curr file
  { "tpope/vim-repeat", event = "VeryLazy" }, -- Repeat.vim remaps . in a way that plugins can tap into it.
  { "nvim-lua/plenary.nvim" },
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "GBrowse", "Gdiffsplit", "Gvdiffsplit" },
    dependencies = {
      "tpope/vim-rhubarb",
    },
    -- stylua: ignore
    keys = {
      { "<leader>gs", "<cmd>Git<cr>", desc = "Status" },
    },
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help" } },
    -- stylua: ignore
    keys = {
      { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      defaults = {
        ["<leader>g"] = { name = "+Git" },
      },
    },
  },
}
