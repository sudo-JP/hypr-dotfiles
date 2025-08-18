---@type LazySpec

return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ensure_installed = {
      -- ╭───────────── LSPs ─────────────╮
      "lua_ls",
      "tsserver",
      "cssls",
      "bashls",
      "dockerls",
      "docker_compose_language_service",
      "cmake",
      "clangd",
      "jdtls",
      "sqlls",

      -- ╭────────── Formatters ──────────╮
      "prettier",        -- JS/TS/CSS/HTML/JSON formatter
      "stylua",          -- Lua formatter
      "shfmt",           -- Bash formatter
      "clang-format",    -- C/C++/CMake formatter
      "sql-formatter",   -- SQL formatter
      "google-java-format", -- Java formatter

      -- ╭─────────── Linters ───────────╮
      "eslint_d",        -- JS/TS linter
      "shellcheck",      -- Bash linter
      "hadolint",        -- Dockerfile linter
      "cmakelint",       -- CMake linter
      "sqlfluff",        -- SQL linter
    },
    auto_update = true,
    run_on_start = true,
  },
}
