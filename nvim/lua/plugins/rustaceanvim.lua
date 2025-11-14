return {
  "mrcjkb/rustaceanvim",
  version = "^4", -- keep it up to date with the latest compatible release
  ft = { "rust" },
  config = function()
    vim.g.rustaceanvim = {
      server = {
        on_attach = function(_, bufnr)
        end,
        default_settings = {
          ["rust-analyzer"] = {
            cargo = { allFeatures = true },
            checkOnSave = { command = "clippy" },
          },
        },
      },
    }
  end,
   
}
