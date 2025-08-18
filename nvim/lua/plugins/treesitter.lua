
-- Customize Treesitter

return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      -- Core
      "lua",
      "vim",
      "vimdoc",
      "query",

      -- Web
      "javascript",
      "typescript",
      "tsx",
      "json",
      "html",
      "css",

      -- Scripting / Config
      "bash",
      "dockerfile",
      "cmake",
      "yaml",

      -- Systems
      "c",           -- C language
      "cpp",         -- C++

      -- Java
      "java",

      -- Databases
      "sql",
    },
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
  },
}
