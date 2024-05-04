return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      defaults = {
        ["<leader>l"] = { name = "+LSP" },
      },
    },
  },

  {
    -- LSP config collection
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "j-hui/fidget.nvim", config = true }, -- Standalone UI for nvim-lsp progress. Eye candy for the impatient.
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim", -- makes using mason.nvim with lspconfig together easier
      -- "jay-babu/mason-null-ls.nvim", -- makes using mason.nvim with null-ls easier.
    },
    opts = {
      servers = {},
      setup = {},

      capabilities = {
        textDocument = {
          foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
          },
        },
      },
    },
    config = function(plugin, opts)
      require("base.lsp.servers").setup(plugin, opts)
    end,
  },

  {
    -- Portable package manager for Neovim that runs everywhere Neovim runs.
    -- Easily install and manage LSP servers, DAP servers, linters, and formatters.
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    cmd = "Mason",
    opts = {
      ensure_installed = {
        "shfmt",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require "mason-registry"
      local function ensure_installed()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end
      if mr.refresh then
        mr.refresh(ensure_installed)
      else
        ensure_installed()
      end
    end,
  },

  {
    -- a language server to inject LSP diagnostics, code actions, and more via Lua.
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require "null-ls"
      return {
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
        sources = {
          nls.builtins.formatting.shfmt,
        },
      }
    end,
  },
}
