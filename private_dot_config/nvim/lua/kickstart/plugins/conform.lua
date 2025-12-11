return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        if disable_filetypes[vim.bo[bufnr].filetype] then
          return nil
        else
          return {
            timeout_ms = 500,
            lsp_format = 'fallback',
          }
        end
      end,
      formatters_by_ft = {
        purescript = { 'purstidy', stop_after_first = true },
        lua = { 'stylua', stop_after_first = true },
        ocaml = { 'ocamlformat', stop_after_first = true },
        python = { 'black' },
        rust = { 'rustfmt' },
        javascript = { 'prettier', stop_after_first = true },
        javascriptreact = { 'prettier', stop_after_first = true },
        typescript = { 'prettier', stop_after_first = true },
        typescriptreact = { 'prettier', stop_after_first = true },
        astro = { 'astro', stop_after_first = true },
        go = { 'gofumpt', 'golines', 'goimports-reviser' },
        c = { 'clang_format' },
        cpp = { 'clang_format' },
        haskell = { 'ormolu' },
        yaml = { 'yamlfmt' },
        html = { 'prettier' },
        json = { 'prettier' },
        markdown = { 'prettier' },
        gleam = { 'gleam' },
        asm = { 'asmfmt' },
        css = { 'prettier', stop_after_first = true },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use 'stop_after_first' to run the first available formatter from the list
        -- javascript = { "prettierd", "prettier", stop_after_first = true },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
