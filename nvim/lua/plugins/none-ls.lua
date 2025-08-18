return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    local nls = require "null-ls"
    opts.sources = vim.list_extend(opts.sources or {}, {
      -- JavaScript / TypeScript
      nls.builtins.formatting.prettier,
      nls.builtins.diagnostics.eslint_d,

      -- Lua
      nls.builtins.formatting.stylua,

      -- Bash
      nls.builtins.formatting.shfmt,
      nls.builtins.diagnostics.shellcheck,

      -- Docker
      nls.builtins.diagnostics.hadolint,

      -- C / C++
      nls.builtins.formatting.clang_format,

      -- CMake
      nls.builtins.diagnostics.cmake_lint,

      -- SQL
      nls.builtins.formatting.sql_formatter,
      nls.builtins.diagnostics.sqlfluff,

      -- Java
      nls.builtins.formatting.google_java_format,
    })
  end,
}
