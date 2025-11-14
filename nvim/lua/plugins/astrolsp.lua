
-- ~/.config/nvim/lua/plugins/astrolsp.lua
return {
  "AstroNvim/astrolsp",
  opts = {
    features = {
      codelens = true,
      inlay_hints = false,
      semantic_tokens = true,
    },
    formatting = {
      format_on_save = {
        enabled = false,
        allow_filetypes = {},
        ignore_filetypes = {},
      },
      disabled = {},
      timeout_ms = 1000,
    },
    servers = {
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
    },
    config = {
      clangd = {
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--completion-style=detailed",
          "--header-insertion=never",
        },
      },
    },
    handlers = {},
    autocmds = {},
    mappings = {},
    -- 🔥 Make absolutely sure no format-on-save survives
    on_attach = function(client, bufnr)
      pcall(function()
        vim.api.nvim_clear_autocmds { group = "lsp_auto_format", buffer = bufnr }
      end)
    end,
  },

  -- 🚫 Disable AstroLSP autoformat hooks after load
  config = function(_, opts)
    require("astrolsp").setup(opts)
    -- This removes AstroLSP’s autoformat autocmds globally
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local bufnr = args.buf
        pcall(function()
          vim.api.nvim_clear_autocmds { group = "lsp_auto_format", buffer = bufnr }
        end)
      end,
    })
  end,
}
